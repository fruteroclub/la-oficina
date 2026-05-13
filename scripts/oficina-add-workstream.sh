#!/usr/bin/env bash
#
# oficina-add-workstream.sh — Scaffold a workstream under a project.
#
# Usage: oficina-add-workstream.sh <workstream-name> --pod <pod-id> --workspace <workspace-id> --project <project-name> [--owner OWNER] [--thread-id ID]
#
# Creates (intern-os v0.4.1 compatible):
#   pods/<pod-id>/office/workspaces/<ws>/projects/<p>/workstreams/<workstream-name>/{BRIEF.md,STATUS.md,MEMORY.md,DECISIONS.md,STAKEHOLDERS.md,RESOURCES.md,SESSIONS.md,docs/.gitkeep}
#
# Updates:
#   project PROJECT.md (active_workstreams list)
#   project INDEX.md
#   project TICK.md (optional task seed)

set -euo pipefail

WORKSTREAM_NAME="${1:-}"
[ -z "$WORKSTREAM_NAME" ] && { echo "usage: oficina-add-workstream <name> --pod <pod-id> --workspace <ws-id> --project <project> [...]" >&2; exit 2; }

echo "TODO: implement oficina-add-workstream.sh" >&2
exit 1
