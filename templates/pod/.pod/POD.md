---
pod_id: {{POD_ID}}
pod_name: {{POD_NAME}}
owner: {{POD_OWNER}}
created: {{CREATED_DATE}}
status: active
purpose: "{{POD_PURPOSE}}"
agent_harness: {{AGENT_HARNESS}}
loadable_by: invitation
---

# Pod: {{POD_NAME}}

{{POD_PURPOSE}}

## Structure

- `.pod/` — pod marker, agent bootstrap, internOS status
- `office/` — orchestration: workspaces / projects / workstreams

## Workspaces (under office/workspaces/)

(none yet — run `oficina add-workspace <name> --pod {{POD_ID}}`)
