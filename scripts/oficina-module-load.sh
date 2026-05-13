#!/usr/bin/env bash
#
# oficina-module-load.sh — Emit a scoped context bundle for an agent.
#
# Usage: oficina-module-load.sh <path> [--children-depth N]
#   <path> is any directory inside a La Oficina-managed agency.
#   --children-depth defaults to 1 (immediate children identity files).
#                    0 = skip children section entirely.
#                    >1 not yet supported in v0.1.0 (treated as 1).
#
# Output (stdout, markdown):
#   <!-- bundle: orientation -->  — identity files walked up from target
#   <!-- bundle: target -->       — target identity + AGENTS.md + INDEX.md
#   <!-- bundle: children -->     — immediate children identity files
#   <!-- bundle: scope -->        — read/write/forbidden statement
#
# See docs/module-loading.md for the bundle contract.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RESOLVE="$SCRIPT_DIR/oficina-resolve.sh"

# --- args ---
TARGET_PATH=""
CHILDREN_DEPTH=1
while [ $# -gt 0 ]; do
  case "$1" in
    --children-depth)
      shift
      CHILDREN_DEPTH="${1:-1}"
      ;;
    --children-depth=*)
      CHILDREN_DEPTH="${1#*=}"
      ;;
    -h|--help)
      sed -n '2,20p' "$0" | sed 's/^# \{0,1\}//'
      exit 0
      ;;
    *)
      [ -z "$TARGET_PATH" ] && TARGET_PATH="$1" || {
        echo "oficina-module-load: unexpected arg: $1" >&2
        exit 2
      }
      ;;
  esac
  shift
done

[ -z "$TARGET_PATH" ] && {
  echo "usage: oficina-module-load <path> [--children-depth N]" >&2
  exit 2
}

# --- resolve target ---
if ! RESOLVE_OUT="$("$RESOLVE" "$TARGET_PATH")"; then
  echo "oficina-module-load: resolve failed for $TARGET_PATH" >&2
  exit 1
fi
eval "$RESOLVE_OUT"

# Override target root to the path the user passed (which may sit BELOW the
# identity level, e.g. a workstream's docs/ subdir).  For bundle purposes
# we treat the deepest matched identity as the target.
TARGET_ROOT=""
case "$MODULE_LEVEL" in
  workstream) TARGET_ROOT="$WORKSTREAM_ROOT" ;;
  project)    TARGET_ROOT="$PROJECT_ROOT" ;;
  workspace)  TARGET_ROOT="$WORKSPACE_ROOT" ;;
  office)     TARGET_ROOT="$OFFICE_ROOT" ;;
  pod)        TARGET_ROOT="$POD_ROOT" ;;
  agency)     TARGET_ROOT="$AGENCY_ROOT" ;;
  *)
    echo "oficina-module-load: unable to determine module level for $TARGET_PATH" >&2
    exit 1
    ;;
esac

# --- helpers ---

# emit_file <label> <path>
# Prints "## <label>\n\n<file contents>\n" if the file exists; nothing otherwise.
emit_file() {
  local label="$1"
  local path="$2"
  if [ -f "$path" ]; then
    printf '## %s\n\n' "$label"
    cat "$path"
    printf '\n'
  fi
}

# emit_h1 <label> <path>
# Like emit_file but with H1 heading; used for orientation parent chain.
emit_h1() {
  local label="$1"
  local path="$2"
  if [ -f "$path" ]; then
    printf '# %s\n\n' "$label"
    cat "$path"
    printf '\n'
  fi
}

# list_children — echo one "label|path" pair per child of TARGET_ROOT at MODULE_LEVEL+1
list_children() {
  case "$MODULE_LEVEL" in
    agency)
      [ -d "$AGENCY_ROOT/pods" ] || return 0
      for d in "$AGENCY_ROOT"/pods/*/; do
        [ -d "$d" ] || continue
        local name
        name="$(basename "$d")"
        echo "Pod: $name|$d.pod/POD.md"
      done
      ;;
    pod)
      [ -d "$POD_ROOT/office" ] || return 0
      echo "Office (lab)|$POD_ROOT/office/OFFICE.md"
      ;;
    office)
      [ -d "$OFFICE_ROOT/workspaces" ] || return 0
      for d in "$OFFICE_ROOT"/workspaces/*/; do
        [ -d "$d" ] || continue
        local name
        name="$(basename "$d")"
        echo "Workspace: $name|${d}WORKSPACE.md"
      done
      ;;
    workspace)
      [ -d "$WORKSPACE_ROOT/projects" ] || return 0
      for d in "$WORKSPACE_ROOT"/projects/*/; do
        [ -d "$d" ] || continue
        local name
        name="$(basename "$d")"
        echo "Project: $name|${d}PROJECT.md"
      done
      ;;
    project)
      [ -d "$PROJECT_ROOT/workstreams" ] || return 0
      for d in "$PROJECT_ROOT"/workstreams/*/; do
        [ -d "$d" ] || continue
        local name
        name="$(basename "$d")"
        echo "Workstream: $name|${d}BRIEF.md"
      done
      ;;
    workstream)
      # Workstreams have no further nested children at v0.1.0.
      return 0
      ;;
  esac
}

# --- emit bundle ---

# Orientation: parent identity files top-down.  Skip identities AT or BELOW target.
printf '<!-- bundle: orientation -->\n\n'
case "$MODULE_LEVEL" in
  agency)
    printf '_Target is the agency root; no parent chain in the La Oficina hierarchy._\n\n'
    ;;
  pod)
    printf '_Target is a pod; agency identity is harness-owned (SOUL.md is not part of La Oficina)._\n\n'
    ;;
esac
[ "$MODULE_LEVEL" != "agency" ] && [ "$MODULE_LEVEL" != "pod" ] && [ -n "$POD_ROOT" ] && \
  emit_h1 "Pod: $POD" "$POD_ROOT/.pod/POD.md"
[ "$MODULE_LEVEL" != "agency" ] && [ "$MODULE_LEVEL" != "pod" ] && [ "$MODULE_LEVEL" != "office" ] && [ -n "$OFFICE_ROOT" ] && \
  emit_h1 "Office: $(basename "$OFFICE_ROOT")" "$OFFICE_ROOT/OFFICE.md"
case "$MODULE_LEVEL" in
  project|workstream)
    [ -n "$WORKSPACE_ROOT" ] && emit_h1 "Workspace: $WORKSPACE" "$WORKSPACE_ROOT/WORKSPACE.md"
    ;;
esac
case "$MODULE_LEVEL" in
  workstream)
    [ -n "$PROJECT_ROOT" ] && emit_h1 "Project: $PROJECT" "$PROJECT_ROOT/PROJECT.md"
    ;;
esac

# Target: identity + AGENTS + INDEX (TICK at project level too)
printf '<!-- bundle: target -->\n\n'
case "$MODULE_LEVEL" in
  agency)
    emit_h1 "Agency root" "$AGENCY_ROOT/README.md"
    emit_file "AGENTS.md" "$AGENCY_ROOT/AGENTS.md"
    emit_file "INDEX.md"  "$AGENCY_ROOT/INDEX.md"
    ;;
  pod)
    emit_h1 "Pod: $POD" "$POD_ROOT/.pod/POD.md"
    emit_file "BOOTSTRAP.md" "$POD_ROOT/.pod/BOOTSTRAP.md"
    emit_file "STATUS.md (pod)" "$POD_ROOT/.pod/STATUS.md"
    emit_file "AGENTS.md" "$POD_ROOT/AGENTS.md"
    emit_file "INDEX.md"  "$POD_ROOT/INDEX.md"
    ;;
  office)
    emit_h1 "Office: $(basename "$OFFICE_ROOT")" "$OFFICE_ROOT/OFFICE.md"
    emit_file "AGENTS.md" "$OFFICE_ROOT/AGENTS.md"
    emit_file "INDEX.md"  "$OFFICE_ROOT/INDEX.md"
    ;;
  workspace)
    emit_h1 "Workspace: $WORKSPACE" "$WORKSPACE_ROOT/WORKSPACE.md"
    emit_file "AGENTS.md" "$WORKSPACE_ROOT/AGENTS.md"
    emit_file "INDEX.md"  "$WORKSPACE_ROOT/INDEX.md"
    ;;
  project)
    emit_h1 "Project: $PROJECT" "$PROJECT_ROOT/PROJECT.md"
    emit_file "AGENTS.md" "$PROJECT_ROOT/AGENTS.md"
    emit_file "INDEX.md"  "$PROJECT_ROOT/INDEX.md"
    emit_file "TICK.md"   "$PROJECT_ROOT/TICK.md"
    ;;
  workstream)
    emit_h1 "Workstream: $WORKSTREAM" "$WORKSTREAM_ROOT/BRIEF.md"
    emit_file "STATUS.md"       "$WORKSTREAM_ROOT/STATUS.md"
    emit_file "MEMORY.md"       "$WORKSTREAM_ROOT/MEMORY.md"
    emit_file "DECISIONS.md"    "$WORKSTREAM_ROOT/DECISIONS.md"
    emit_file "STAKEHOLDERS.md" "$WORKSTREAM_ROOT/STAKEHOLDERS.md"
    emit_file "RESOURCES.md"    "$WORKSTREAM_ROOT/RESOURCES.md"
    emit_file "SESSIONS.md"     "$WORKSTREAM_ROOT/SESSIONS.md"
    ;;
esac

# Children: identity files of immediate children (depth 1)
if [ "$CHILDREN_DEPTH" -gt 0 ] 2>/dev/null; then
  printf '<!-- bundle: children -->\n\n'
  child_count=0
  while IFS='|' read -r label path; do
    [ -z "$label" ] && continue
    if [ -f "$path" ]; then
      printf '## %s\n\n' "$label"
      cat "$path"
      printf '\n'
      child_count=$((child_count + 1))
    fi
  done < <(list_children)
  [ "$child_count" -eq 0 ] && printf '_No children at this level._\n\n'
fi

# Scope
printf '<!-- bundle: scope -->\n\n'
printf 'Read scope: %s/**\n' "$TARGET_ROOT"
printf 'Write scope: per AGENTS.md at %s\n' "$TARGET_ROOT"
printf 'Forbidden: anything outside %s/\n\n' "$TARGET_ROOT"
printf 'Module level: %s\n' "$MODULE_LEVEL"
printf 'Agency: %s\n' "$AGENCY_ROOT"
[ -n "$POD" ]        && printf 'Pod: %s\n' "$POD"
[ -n "$WORKSPACE" ]  && printf 'Workspace: %s\n' "$WORKSPACE"
[ -n "$PROJECT" ]    && printf 'Project: %s\n' "$PROJECT"
[ -n "$WORKSTREAM" ] && printf 'Workstream: %s\n' "$WORKSTREAM"
printf '\n'
printf 'Loading complete. Read children identity files on demand,\n'
printf 'or open BRIEF.md of a target workstream to begin execution.\n'
