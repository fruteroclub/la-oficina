#!/usr/bin/env bash
#
# oficina-add-project.sh — Scaffold a project under a workspace.
#
# Usage: oficina-add-project.sh <project-name> --pod <pod-id> --workspace <workspace-id> [--owner OWNER] [--purpose "..."]
#
# Creates:
#   pods/<pod-id>/office/workspaces/<workspace-id>/projects/<project-name>/{PROJECT.md,AGENTS.md,INDEX.md,TICK.md,workstreams/.gitkeep}
#
# Updates:
#   workspace WORKSPACE.md (projects table)
#   workspace INDEX.md
#   workspace LOG.md

set -euo pipefail

PROJECT_NAME="${1:-}"
[ -z "$PROJECT_NAME" ] && { echo "usage: oficina-add-project <project-name> --pod <pod-id> --workspace <workspace-id> [...]" >&2; exit 2; }

echo "TODO: implement oficina-add-project.sh" >&2
exit 1
