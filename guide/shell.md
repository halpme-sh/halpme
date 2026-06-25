### Shell & Navigation
<!-- halpme: shell | Directory jumps, command line editing, modern tool replacements -->

**Directory jumping (zoxide):**

```bash
z projects    # jump by partial name (frecency-based)
zi            # interactive fuzzy picker
```

**Modern tool replacements (auto-aliased when installed):**

| You type | Actually runs | Why |
|----------|--------------|-----|
| `cat` | `bat` | Syntax highlighting |
| `ls` | `eza` | Colors, git status |
| `grep` | `ripgrep` | Faster, respects .gitignore |
| `find` | `fd` | Simpler syntax |

**Reload shell after config changes:**

```bash
exec zsh -l   # replaces the process, clean slate (alias: reload)
```

---
