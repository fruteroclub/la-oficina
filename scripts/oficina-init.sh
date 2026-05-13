#!/usr/bin/env bash
#
# oficina-init.sh — Initialize an agency at the current directory (or --path).
#
# Usage: oficina-init.sh [--path PATH] [--name NAME] [--owner OWNER] [--force]
#
# Creates:
#   - .obsidian/{app.json,appearance.json}    (LLM-Wiki vault marker)
#   - .oficina/{config.yaml,pods.yaml}        (La Oficina marker)
#   - README.md / INDEX.md / AGENTS.md / LOG.md
#   - pods/ (empty container with .gitkeep)
#
# Idempotent: skips files that already exist unless --force.
#
# Implementation strategy:
#   - Copy templates/agency-init/ tree, substituting {{VARS}}.
#   - Substitution: OFICINA_VERSION (from VERSION), AGENCY_NAME, AGENCY_OWNER, CREATED_DATE.
#   - Best-effort check: warn if SOUL.md not present (agent harness may not be installed yet — that's OK).
#   - Append agency-init entry to LOG.md.

set -euo pipefail

PATH_ARG="${PATH_ARG:-$PWD}"
NAME=""
OWNER=""
FORCE=0

# TODO: parse args properly
# TODO: read template paths relative to skill install location (SKILL_DIR)
# TODO: substitute template variables
# TODO: write files atomically (tmp + mv)

echo "TODO: implement oficina-init.sh" >&2
exit 1
