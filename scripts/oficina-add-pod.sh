#!/usr/bin/env bash
#
# oficina-add-pod.sh — Scaffold a new pod under pods/<name>/.
#
# Usage: oficina-add-pod.sh <pod-id> [--name NAME] [--owner OWNER] [--purpose "..."] [--harness {hermes,claude-code,...,tbd}]
#
# Creates:
#   pods/<pod-id>/.pod/{POD.md,BOOTSTRAP.md,STATUS.md}
#   pods/<pod-id>/{INDEX.md,AGENTS.md,LOG.md}
#   pods/<pod-id>/office/{OFFICE.md,INDEX.md,AGENTS.md,LOG.md,CLAUDE.md,journal/INDEX.md,workspaces/}
#
# Updates:
#   .oficina/pods.yaml (registry)
#   ./INDEX.md (pods table)
#   ./LOG.md (structural event)
#
# Requires: cwd inside an agency (.oficina/ marker present going up).
# Errors if pods/<pod-id>/ already exists.
#
# Implementation strategy:
#   - Resolve agency root via oficina-resolve.sh
#   - Copy templates/pod/ tree, substituting {{POD_ID}}, {{POD_NAME}}, {{POD_OWNER}}, {{POD_PURPOSE}}, {{AGENT_HARNESS}}, {{CREATED_DATE}}
#   - yq-update .oficina/pods.yaml to append new pod entry
#   - Regenerate agency INDEX.md (call oficina-index.sh)

set -euo pipefail

POD_ID="${1:-}"
[ -z "$POD_ID" ] && { echo "usage: oficina-add-pod <pod-id> [...]" >&2; exit 2; }

echo "TODO: implement oficina-add-pod.sh" >&2
exit 1
