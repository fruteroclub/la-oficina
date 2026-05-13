# Generic adapter

Use La Oficina without any specific agent harness.

## Install

Clone the repo somewhere on your PATH:

```bash
git clone https://github.com/fruteroclub/la-oficina.git ~/.local/share/la-oficina
ln -s ~/.local/share/la-oficina/scripts/oficina-*.sh ~/.local/bin/
# Or add the scripts dir to your PATH
```

## First use

```bash
mkdir -p ~/my-agency
cd ~/my-agency
oficina-init.sh --name my-agency --owner <yourname>
oficina-add-pod.sh lab --owner <yourname> --purpose "personal sandbox"
```

## No harness, no problem

La Oficina is harness-agnostic. You can use it as a filesystem convention manager without any AI agent at all — useful for:

- Solo developers organizing multiple client engagements
- Personal knowledge management with pod-shaped scoping
- Trying out the structure before committing to a harness

When you eventually add a harness:

1. Install the harness at the agency root (SOUL.md or equivalent lands there)
2. `oficina seed-wiki` to bring harness config into the LLM-Wiki
3. Configure the harness to use the pod / workspace / project / workstream paths

## BYOA for contributors

If a contributor wants to bring their own agent harness to your agency, share a GitHub URL to the relevant module. They run their harness, read AGENTS.md at the URL, and operate within scope.

See `docs/byoa.md`.
