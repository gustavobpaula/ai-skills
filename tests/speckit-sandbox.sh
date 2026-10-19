#!/bin/sh

# Create a clean GitHub Spec Kit project for running behavioral scenarios.
# Usage: tests/speckit-sandbox.sh <target-dir> [integration...]
# Integrations default to "claude"; pass "claude codex" to install both.

set -eu

if [ "$#" -lt 1 ]; then
  printf 'Usage: %s <target-dir> [integration...]\n' "$0" >&2
  exit 1
fi

target=$1
shift
[ "$#" -gt 0 ] || set -- claude

command -v specify >/dev/null 2>&1 || {
  printf 'specify CLI not found; install it with: uv tool install specify-cli --from git+https://github.com/github/spec-kit.git\n' >&2
  exit 1
}

if [ -e "$target" ]; then
  printf 'Refusing to overwrite existing path: %s\n' "$target" >&2
  exit 1
fi

first=$1
shift
specify init "$target" --integration "$first" --non-interactive >/dev/null

for integration in "$@"; do
  (cd "$target" && specify integration install "$integration" >/dev/null)
done

cd "$target"
git init -q
git add -A
git -c user.name=sandbox -c user.email=sandbox@example.invalid commit -q -m 'Spec Kit sandbox baseline'

printf 'Spec Kit sandbox ready: %s\n' "$(pwd)"
printf 'Spec Kit version: %s\n' "$(specify --version 2>/dev/null | head -n 1)"
