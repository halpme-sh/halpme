### Git Workflow
<!-- halpme: git | Daily aliases, undo, stash, conflict resolution -->

**Daily aliases:**

| What | Command |
|------|---------|
| Status (compact) | `gs` |
| Pull + prune | `gl` |
| Push to origin | `gp` |
| Diff | `gd` |
| Log (visual graph) | `glog` |
| Stage all + commit | `gac "feat: ..."` |

---

### Making a Commit
<!-- halpme: commit | Conventional Commits format and workflow -->

**Format:** `type(scope): subject`

| Type | Use for |
|------|---------|
| `feat` | New feature |
| `fix` | Bug fix |
| `chore` | Config, deps, tooling |
| `docs` | Documentation |
| `refactor` | Restructure, no behavior change |

```bash
gc                             # interactive commit (Commitizen)
gac "feat(ui): add dark mode"  # fast path when you know the format
```

---
