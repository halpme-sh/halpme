# halpme

Terminal help for *your* setup. Document your aliases, workflows, and tool configurations in Markdown — then find them instantly.

```bash
halpme          # browse your guide
halpme git      # jump to git sections
halpme brew     # jump to brew sections
```

## Install

**With Claude Code (recommended):**

```bash
npx skills add halpme-sh/halpme
```

Open Claude Code and run the `halpme` skill. It installs the script, sets up your config directory, and runs an AI-assisted session to build your guide from your existing dotfiles.

**Manual install:**

```bash
# 1. Install glow (required)
brew install glow

# 2. Download the script
curl -fsSL https://raw.githubusercontent.com/halpme-sh/halpme/main/halpme.zsh -o ~/bin/halpme.zsh
chmod +x ~/bin/halpme.zsh

# 3. Add alias to your shell config
echo 'alias halpme="zsh ~/bin/halpme.zsh"' >> ~/.zshrc

# 4. Copy starter topic files
mkdir -p ~/.config/halpme
for topic in git shell brew; do
  curl -fsSL "https://raw.githubusercontent.com/halpme-sh/halpme/main/guide/$topic.md" \
    -o "$HOME/.config/halpme/$topic.md"
done
```

## Annotation convention

Mark each section with an HTML comment immediately after the `###` header:

```markdown
### Git Workflow
<!-- halpme: git | Daily git aliases and undo commands -->

Content here...

---
```

- **keyword** — what you type (`halpme git`)
- **description** — appears in the TOC (`halpme` with no args)

## Your guide

Topic files live in `~/.config/halpme/`. Each `.md` file is one topic.

```
~/.config/halpme/
├── git.md
├── shell.md
├── brew.md
└── anything-you-want.md
```

Add a file, add a section — it appears in `halpme` automatically.

## Configuration

| Env var | Default | Purpose |
|---------|---------|---------|
| `HALPME_DIR` | `~/.config/halpme` | Topic file location |
| `HALPME_WIDTH` | `100` | Render width |

## Dependencies

- [glow](https://github.com/charmbracelet/glow) — `brew install glow`
