# dotfiles

Reproduces this machine's global Claude Code setup on a new PC.

## What's tracked

- `claude/settings.json` — global plugin enablement (ECC, Vercel) and
  preferences. Copied verbatim to `~/.claude/settings.json`.
- `claude/skills-lock.json` — reference copy of the lock file
  `npx skills` maintains; not restored directly, just documents which
  skills/hashes were installed as of the last sync.
- `install.ps1` — bootstraps a fresh machine: copies `settings.json` into
  place, then re-runs the two installers that actually populate skills
  and plugins.

## What's deliberately NOT tracked

- `~/.claude/settings.local.json` — per-project Bash/WebFetch permission
  allowlists accumulated for one specific project (findthecool). Noise
  on a new machine, not general setup.
- `~/.claude/plugins/cache` and `~/.agents/skills/*` — the actual skill
  and plugin source trees. These are large, regenerable, and get
  re-cloned by the installers below rather than copied.
- Anything under a project's own repo (e.g. `.claude/` inside a project)
  — that belongs to the project, not to this machine.

## New machine setup

```powershell
git clone <this-repo> ~/dotfiles
cd ~/dotfiles
./install.ps1
```

Or by hand:

```powershell
Copy-Item claude/settings.json $HOME/.claude/settings.json -Force
npx skills@latest add emilkowalski/skills -g
npx impeccable install
```

Restart Claude Code afterward to pick everything up.

## Keeping this in sync

There's no automatic sync — after installing new global skills/plugins,
re-copy `~/.claude/settings.json` and `~/.claude/skills-lock.json` into
this repo and commit.
