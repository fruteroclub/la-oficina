#!/usr/bin/env bash
#
# oficina-resolve.sh — Walk up from cwd to identify the current module.
#
# Usage: oficina-resolve.sh [PATH]
#   PATH defaults to $PWD.
#
# Output (one KEY=value per line; safe to `eval`):
#   AGENCY_ROOT=...
#   POD=...                (basename of POD_ROOT)
#   POD_ROOT=...
#   OFFICE_ROOT=...        (if pod has an office subtree containing PATH)
#   WORKSPACE=...
#   WORKSPACE_ROOT=...
#   PROJECT=...
#   PROJECT_ROOT=...
#   WORKSTREAM=...
#   WORKSTREAM_ROOT=...
#   MODULE_LEVEL=agency|pod|office|workspace|project|workstream|unknown
#
# Exit 0 if PATH is inside an agency (.oficina/ ancestor found).
# Exit 1 if not inside any agency.
# Exit 2 on argument / path errors.
#
# Markers (per docs/shape.md):
#   .oficina/        → agency root
#   .pod/            → pod root
#   OFFICE.md        → office level
#   WORKSPACE.md     → workspace level
#   PROJECT.md       → project level
#   BRIEF.md         → workstream level

set -euo pipefail

START_PATH="${1:-$PWD}"

if ! START_PATH="$(cd "$START_PATH" 2>/dev/null && pwd)"; then
  echo "oficina-resolve: path does not exist: ${1:-$PWD}" >&2
  exit 2
fi

AGENCY_ROOT=""
POD_ROOT=""
POD=""
OFFICE_ROOT=""
WORKSPACE_ROOT=""
WORKSPACE=""
PROJECT_ROOT=""
PROJECT=""
WORKSTREAM_ROOT=""
WORKSTREAM=""
MODULE_LEVEL="unknown"

# Walk up; the first (deepest) match for each level wins.
cur="$START_PATH"
while :; do
  if [ -z "$WORKSTREAM_ROOT" ] && [ -f "$cur/BRIEF.md" ]; then
    WORKSTREAM_ROOT="$cur"
    WORKSTREAM="$(basename "$cur")"
    [ "$MODULE_LEVEL" = "unknown" ] && MODULE_LEVEL="workstream"
  fi
  if [ -z "$PROJECT_ROOT" ] && [ -f "$cur/PROJECT.md" ]; then
    PROJECT_ROOT="$cur"
    PROJECT="$(basename "$cur")"
    [ "$MODULE_LEVEL" = "unknown" ] && MODULE_LEVEL="project"
  fi
  if [ -z "$WORKSPACE_ROOT" ] && [ -f "$cur/WORKSPACE.md" ]; then
    WORKSPACE_ROOT="$cur"
    WORKSPACE="$(basename "$cur")"
    [ "$MODULE_LEVEL" = "unknown" ] && MODULE_LEVEL="workspace"
  fi
  if [ -z "$OFFICE_ROOT" ] && [ -f "$cur/OFFICE.md" ]; then
    OFFICE_ROOT="$cur"
    [ "$MODULE_LEVEL" = "unknown" ] && MODULE_LEVEL="office"
  fi
  if [ -z "$POD_ROOT" ] && [ -d "$cur/.pod" ]; then
    POD_ROOT="$cur"
    POD="$(basename "$cur")"
    [ "$MODULE_LEVEL" = "unknown" ] && MODULE_LEVEL="pod"
  fi
  if [ -z "$AGENCY_ROOT" ] && [ -d "$cur/.oficina" ]; then
    AGENCY_ROOT="$cur"
    [ "$MODULE_LEVEL" = "unknown" ] && MODULE_LEVEL="agency"
    break
  fi

  parent="$(dirname "$cur")"
  [ "$parent" = "$cur" ] && break
  cur="$parent"
done

if [ -z "$AGENCY_ROOT" ]; then
  echo "oficina-resolve: not inside an agency (no .oficina/ marker found walking up from $START_PATH)" >&2
  printf 'AGENCY_ROOT=\nMODULE_LEVEL=unknown\n'
  exit 1
fi

cat <<EOF
AGENCY_ROOT=$AGENCY_ROOT
POD=$POD
POD_ROOT=$POD_ROOT
OFFICE_ROOT=$OFFICE_ROOT
WORKSPACE=$WORKSPACE
WORKSPACE_ROOT=$WORKSPACE_ROOT
PROJECT=$PROJECT
PROJECT_ROOT=$PROJECT_ROOT
WORKSTREAM=$WORKSTREAM
WORKSTREAM_ROOT=$WORKSTREAM_ROOT
MODULE_LEVEL=$MODULE_LEVEL
EOF
