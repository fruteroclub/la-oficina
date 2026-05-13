# Pod Bootstrap — {{POD_NAME}}

Context-loading instructions for any agent operating inside this pod.

## Step 1 — Establish location
Run `oficina resolve` to determine current module + parent chain.

## Step 2 — Load pod-level context
1. `.pod/POD.md`
2. `.pod/STATUS.md`
3. `office/AGENTS.md`
4. `office/INDEX.md`

## Step 3 — Load module-scoped context
`oficina module-load <path>` returns the scoped bundle for the target module.

## Step 4 — Respect scope
v0.1.0 honor-system enforcement. AGENTS.md at each level declares read/write/forbidden.

## Step 5 — Contribute
PR per repo conventions; pod-level files via agency owner.
