# Hermes adapter

How to install and use La Oficina with Hermes Agent.

## Install

```bash
hermes skills install fruteroclub/la-oficina
```

## Configure

```bash
hermes setup
# When prompted, set:
#   oficina.agency_root = /home/<user>/oficina
```

Or directly in your Hermes config file.

## First use

From your agency root (where SOUL.md lives):

```bash
oficina init                    # Scaffold .obsidian/, .oficina/, pods/
oficina add-pod lab             # Create your first pod
```

## SOUL.md integration

Hermes places SOUL.md at the agency root. La Oficina does not modify it. After `oficina init`, you can run `oficina seed-wiki` to copy SOUL.md content into the LLM-Wiki as a starting page.

## Daemon mode

Dumbleclaw (Hermes daemon) operates pods via the resolve+module-load pattern. On each message:

1. Determine target pod / workspace / project / workstream (via thread binding or message metadata)
2. `oficina module-load <path>` to get the scoped bundle
3. Operate within the bundle's scope
4. Write changes per AGENTS.md write-scope
