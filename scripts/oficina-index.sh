#!/usr/bin/env bash
#
# oficina-index.sh — Regenerate INDEX.md at the given level (or all levels recursively).
#
# Usage: oficina-index.sh [PATH] [--recursive]
#   PATH defaults to $PWD.
#   --recursive walks down and regenerates INDEX.md at every level found.
#
# Reads:
#   - The level's identity file for name/description
#   - Each child's identity file for name/status/purpose
#
# Writes:
#   The level's INDEX.md in the standard shape (see docs/indexing.md).
#
# WARNING: clobbers manual edits to INDEX.md. Put hand-curated content in OVERVIEW.md
# or similar and link to it from INDEX.md so it survives regeneration.

set -euo pipefail

TARGET="${1:-$PWD}"

echo "TODO: implement oficina-index.sh" >&2
exit 1
