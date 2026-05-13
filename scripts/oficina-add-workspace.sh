#!/usr/bin/env bash
#
# oficina-add-workspace.sh — Scaffold a workspace under a pod's office.
#
# Usage: oficina-add-workspace.sh <workspace-id> --pod <pod-id> [--name NAME] [--role {org,client,partner,internal,purpose}] [--owner OWNER] [--purpose "..."]
#
# Creates:
#   pods/<pod-id>/office/workspaces/<workspace-id>/{WORKSPACE.md,INDEX.md,AGENTS.md,LOG.md,projects/.gitkeep}
#
# Updates:
#   pods/<pod-id>/office/OFFICE.md (workspaces table)
#   pods/<pod-id>/office/INDEX.md
#   pods/<pod-id>/office/LOG.md
#
# Implementation strategy:
#   - Resolve agency root + verify pod exists
#   - Copy templates/workspace/ with substitution
#   - Update office's OFFICE.md table (sed or yq via frontmatter pattern)
#   - Regenerate office INDEX

set -euo pipefail

WORKSPACE_ID="${1:-}"
[ -z "$WORKSPACE_ID" ] && { echo "usage: oficina-add-workspace <workspace-id> --pod <pod-id> [...]" >&2; exit 2; }

echo "TODO: implement oficina-add-workspace.sh" >&2
exit 1
