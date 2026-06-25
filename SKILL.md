# halpme

Install `halpme` and build your personal developer guide from your existing dotfiles.

## When to use

- First-time install: sets up the script, config directory, and starter files, then authors your guide
- Update: re-run after adding new tools or workflows to expand existing topic files

## Install flow

Run this when `~/.config/halpme/` does not exist.

1. Check for `glow`:
   ```bash
   which glow
   ```
   If missing: `brew install glow`. Confirm it exits 0 before continuing.

2. Download and install the script:
   ```bash
   mkdir -p ~/bin
   curl -fsSL https://raw.githubusercontent.com/halpme-sh/halpme/main/halpme.zsh -o ~/bin/halpme.zsh
   chmod +x ~/bin/halpme.zsh
   ```

3. Check if `halpme` is already aliased in `~/.zshrc` or `~/.aliases.zsh`. If not, append to `~/.zshrc`:
   ```bash
   alias halpme="zsh ~/bin/halpme.zsh"
   ```
   Note this for the finalize step — the user will need to reload their shell.

4. Copy starter topic files:
   ```bash
   mkdir -p ~/.config/halpme
   for topic in git shell brew; do
     curl -fsSL "https://raw.githubusercontent.com/halpme-sh/halpme/main/guide/$topic.md" \
       -o "$HOME/.config/halpme/$topic.md"
   done
   ```

5. Proceed to the authoring flow.

**Update mode** (when `~/.config/halpme/` already exists): skip steps 1–4 and go directly to the authoring flow. Do not overwrite or delete existing topic files.

## Authoring flow

### Phase 1 — Discovery

Read these files if they exist and note every tool, alias, and workflow you find:

- `~/.zshrc`, `~/.zshenv`, `~/.zprofile`
- `~/.aliases.zsh` and any `*.aliases.zsh` in `$HOME`
- `~/.gitconfig`
- `~/Brewfile`
- `~/bin/*.zsh`
- `~/.config/starship.toml`
- `~/.config/tmux/tmux.conf`

### Phase 2 — Drafting

For each topic found (git, brew, shell, tmux, etc.), write a file in `~/.config/halpme/` using this format:

```markdown
### Section Title
<!-- halpme: keyword | Short description for the TOC -->

Content here. Tables for command references. Code blocks for runnable examples.

---
```

Rules:
- One `.md` file per topic
- Skip topics with no meaningful config found
- In update mode: only create files for topics not already in `~/.config/halpme/`; do not modify existing files
- Prefer tables and examples over prose

### Phase 3 — Interview

Ask one question at a time:

1. "I found these topics in your config: [list]. Are there other areas of your setup worth documenting?" — let the user list freely.
2. For each item they name that isn't already covered: "Tell me about your [topic] setup — what do you want to be able to recall?" Draft a section from their answer.
3. "Is there anything you always forget that isn't covered yet?"

Stop when the user says they're done.

### Phase 4 — Finalize

1. Run `zsh ~/bin/halpme.zsh` and show the user their TOC.
2. Tell the user: "Your guide is at `~/.config/halpme/`. Add new `.md` files any time — they appear in `halpme` automatically. Run this skill again to update your guide."
3. If the alias was added in this session: "Reload your shell to activate `halpme`: `exec zsh -l`"
