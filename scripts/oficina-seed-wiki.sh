#!/usr/bin/env bash
#
# oficina-seed-wiki.sh — Seed the LLM-Wiki from agent harness configuration files.
#
# Usage: oficina-seed-wiki.sh [--force]
#
# Reads (from agency root):
#   - SOUL.md (or whatever the harness uses for agent identity)
#   - Any harness bootstrap files at agency root
#
# Writes:
#   LLM-Wiki pages at agency root with appropriate frontmatter and Obsidian-style links.
#   Page shape: each source file becomes a wiki page; pages link to related pages
#   when they reference each other.
#
# Idempotent: skips pages that already exist unless --force.
#
# Implementation strategy:
#   - Detect agent harness by file presence (SOUL.md → generic; specific files per harness)
#   - For each source file: read, transform, write to wiki/ or root with frontmatter
#   - Add bidirectional links where sources cross-reference each other

set -euo pipefail

echo "TODO: implement oficina-seed-wiki.sh" >&2
echo "Note: requires an agent harness to be installed at agency root first." >&2
exit 1
