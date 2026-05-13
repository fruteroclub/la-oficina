# AGENTS.md — pod level ({{POD_NAME}})

## Scope
- **Read:** entire pod subtree (`pods/{{POD_ID}}/**`)
- **Write:** pod-scoped files (`.pod/*`, INDEX.md, LOG.md, AGENTS.md, office/**)
- **Forbidden:** outside this pod

## Loading
Read `.pod/BOOTSTRAP.md` for canonical agent context-loading sequence.
