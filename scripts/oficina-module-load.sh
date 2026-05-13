#!/usr/bin/env bash
#
# oficina-module-load.sh — Emit a scoped context bundle for an agent.
#
# Usage: oficina-module-load.sh <path> [--children-depth N]
#   <path> is any directory inside a pod.
#   --children-depth defaults to 1 (immediate children identity files only).
#
# Output (stdout, markdown):
#   - <!-- bundle: orientation --> section: parent identity files walked up
#   - <!-- bundle: target --> section: target AGENTS, INDEX, identity
#   - <!-- bundle: children --> section: immediate children identity files
#   - <!-- bundle: scope --> section: read/write/forbidden statement
#
# See docs/module-loading.md for the bundle shape.
#
# Implementation strategy:
#   - Use oficina-resolve.sh to get parent chain + module level
#   - Read identity files at each parent level
#   - Read AGENTS.md, INDEX.md, identity at target
#   - For each child listed in INDEX.md, read child identity file
#   - Concatenate with bundle markers

set -euo pipefail

TARGET_PATH="${1:-}"
[ -z "$TARGET_PATH" ] && { echo "usage: oficina-module-load <path> [--children-depth N]" >&2; exit 2; }

echo "TODO: implement oficina-module-load.sh" >&2
exit 1
