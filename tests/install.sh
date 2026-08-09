#!/bin/sh

set -eu

script_dir=$(CDPATH= cd -P "$(dirname "$0")" && pwd)
repo_root=$(CDPATH= cd -P "$script_dir/.." && pwd)
installer="$repo_root/scripts/install.sh"
expected_spec_source=$(CDPATH= cd -P "$repo_root/skills/spec" && pwd)
expected_arch_source=$(CDPATH= cd -P "$repo_root/skills/arch-design" && pwd)
expected_feature_source=$(CDPATH= cd -P "$repo_root/skills/feature-implementation" && pwd)
expected_requirements_source=$(CDPATH= cd -P "$repo_root/skills/requirements-review" && pwd)
test_root=$(mktemp -d "${TMPDIR:-/tmp}/ai-skills-test.XXXXXX")

cleanup() {
  rm -rf "$test_root"
}
trap cleanup EXIT HUP INT TERM

fail() {
  printf 'FAIL: %s\n' "$1" >&2
  exit 1
}

expect_failure() {
  if "$@" >/dev/null 2>&1; then
    fail "command unexpectedly succeeded: $*"
  fi
}

sh -n "$installer"
bash -n "$installer"

target_dir="$test_root/target dir"
AI_SKILLS_TARGET_DIR="$target_dir" "$installer" spec arch-design feature-implementation requirements-review >/dev/null
[ -L "$target_dir/spec" ] || fail 'installation did not create a symlink'
[ "$(readlink "$target_dir/spec")" = "$expected_spec_source" ] || fail 'spec symlink is not absolute or points to the wrong source'
[ -L "$target_dir/arch-design" ] || fail 'installation did not create the arch-design symlink'
[ "$(readlink "$target_dir/arch-design")" = "$expected_arch_source" ] || fail 'arch-design symlink is not absolute or points to the wrong source'
[ -L "$target_dir/feature-implementation" ] || fail 'installation did not create the feature-implementation symlink'
[ "$(readlink "$target_dir/feature-implementation")" = "$expected_feature_source" ] || fail 'feature-implementation symlink is not absolute or points to the wrong source'
[ -L "$target_dir/requirements-review" ] || fail 'installation did not create the requirements-review symlink'
[ "$(readlink "$target_dir/requirements-review")" = "$expected_requirements_source" ] || fail 'requirements-review symlink is not absolute or points to the wrong source'

AI_SKILLS_TARGET_DIR="$target_dir" "$installer" spec arch-design feature-implementation requirements-review >/dev/null
AI_SKILLS_TARGET_DIR="$target_dir" "$installer" spec arch-design feature-implementation requirements-review requirements-review >/dev/null

expect_failure env AI_SKILLS_TARGET_DIR="$test_root/no-args" "$installer"
expect_failure env AI_SKILLS_TARGET_DIR="$test_root/unknown" "$installer" missing-skill
expect_failure env AI_SKILLS_TARGET_DIR="$test_root/invalid" "$installer" ../spec

partial_target="$test_root/partial"
expect_failure env AI_SKILLS_TARGET_DIR="$partial_target" "$installer" spec arch-design feature-implementation requirements-review missing-skill
[ ! -e "$partial_target/spec" ] || fail 'validation failure caused a partial installation'
[ ! -e "$partial_target/arch-design" ] || fail 'validation failure caused a partial arch-design installation'
[ ! -e "$partial_target/feature-implementation" ] || fail 'validation failure caused a partial feature-implementation installation'
[ ! -e "$partial_target/requirements-review" ] || fail 'validation failure caused a partial requirements-review installation'

conflict_target="$test_root/conflict"
mkdir -p "$conflict_target/spec"
expect_failure env AI_SKILLS_TARGET_DIR="$conflict_target" "$installer" spec
[ -d "$conflict_target/spec" ] || fail 'conflicting directory was changed'
[ ! -L "$conflict_target/spec" ] || fail 'conflicting directory was replaced by a symlink'

batch_conflict_target="$test_root/batch-conflict"
mkdir -p "$batch_conflict_target/arch-design"
expect_failure env AI_SKILLS_TARGET_DIR="$batch_conflict_target" "$installer" spec arch-design feature-implementation requirements-review
[ ! -e "$batch_conflict_target/spec" ] || fail 'batch conflict caused a partial spec installation'
[ ! -e "$batch_conflict_target/feature-implementation" ] || fail 'batch conflict caused a partial feature-implementation installation'
[ ! -e "$batch_conflict_target/requirements-review" ] || fail 'batch conflict caused a partial requirements-review installation'
[ -d "$batch_conflict_target/arch-design" ] || fail 'batch conflict directory was changed'
[ ! -L "$batch_conflict_target/arch-design" ] || fail 'batch conflict directory was replaced by a symlink'

wrong_link_target="$test_root/wrong-link"
mkdir -p "$wrong_link_target" "$test_root/other"
ln -s "$test_root/other" "$wrong_link_target/spec"
expect_failure env AI_SKILLS_TARGET_DIR="$wrong_link_target" "$installer" spec
[ "$(readlink "$wrong_link_target/spec")" = "$test_root/other" ] || fail 'conflicting symlink was changed'

printf 'PASS: installer syntax and smoke tests\n'
