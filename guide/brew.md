### Homebrew & Brewfile
<!-- halpme: brew | Install packages with wrappers, track in Brewfile -->

The `Brewfile` is the source of truth. Use wrappers so it stays current.

| What | Command |
|------|---------|
| Install formula + record | `brewi ripgrep` |
| Install cask + record | `brewci rectangle` |
| Install everything | `brew bundle` |
| See what's unrecorded | `brewdrift` |

**Workflow:**

```bash
brewi fzf          # installs and updates Brewfile automatically
cdiff Brewfile     # review the change
cadd Brewfile && cfg commit -m "chore(Brewfile): add fzf"
```

---
