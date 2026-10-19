#!/bin/sh

set -eu

script_dir=$(CDPATH= cd -P "$(dirname "$0")" && pwd)

if [ -z "${AI_SKILLS_TARGET_DIR:-}" ]; then
  : "${HOME:?HOME must be set when AI_SKILLS_TARGET_DIR is not provided}"
  AI_SKILLS_TARGET_DIR="$HOME/.claude/skills"
fi
export AI_SKILLS_TARGET_DIR

exec "$script_dir/install.sh" "$@"
