#!/bin/sh

set -eu

usage() {
  printf 'Usage: %s <skill-name> [skill-name ...]\n' "$0" >&2
}

if [ "$#" -eq 0 ]; then
  usage
  exit 64
fi

script_dir=$(CDPATH= cd -P "$(dirname "$0")" && pwd)
repo_root=$(CDPATH= cd -P "$script_dir/.." && pwd)
skills_dir="$repo_root/skills"

if [ -n "${AI_SKILLS_TARGET_DIR:-}" ]; then
  target_dir=$AI_SKILLS_TARGET_DIR
else
  : "${HOME:?HOME must be set when AI_SKILLS_TARGET_DIR is not provided}"
  target_dir="$HOME/.agents/skills"
fi

validate_skill_name() {
  case "$1" in
    ''|*[!a-z0-9-]*|-*|*-)
      printf 'Invalid skill name: %s\n' "$1" >&2
      return 1
      ;;
  esac
}

# Validate every source before changing the destination.
for skill_name in "$@"; do
  validate_skill_name "$skill_name" || exit 65
  source_dir="$skills_dir/$skill_name"

  if [ ! -d "$source_dir" ] || [ ! -f "$source_dir/SKILL.md" ]; then
    printf 'Unknown or invalid skill: %s\n' "$skill_name" >&2
    exit 66
  fi
done

mkdir -p "$target_dir"

# Refuse every conflicting destination before creating any symlink.
for skill_name in "$@"; do
  source_dir=$(CDPATH= cd -P "$skills_dir/$skill_name" && pwd)
  destination="$target_dir/$skill_name"

  if [ -L "$destination" ]; then
    current_target=$(readlink "$destination")
    if [ "$current_target" != "$source_dir" ]; then
      printf 'Refusing to replace existing symlink: %s -> %s\n' "$destination" "$current_target" >&2
      exit 73
    fi
  elif [ -e "$destination" ]; then
    printf 'Refusing to replace existing path: %s\n' "$destination" >&2
    exit 73
  fi
done

for skill_name in "$@"; do
  source_dir=$(CDPATH= cd -P "$skills_dir/$skill_name" && pwd)
  destination="$target_dir/$skill_name"

  if [ -L "$destination" ]; then
    printf 'Already installed: %s\n' "$skill_name"
  else
    ln -s "$source_dir" "$destination"
    printf 'Installed: %s -> %s\n' "$skill_name" "$source_dir"
  fi
done
