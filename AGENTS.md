# AGENTS.md

Instructions for AI coding agents working in this repository.

## Project Overview

Cross-platform dotfiles managed with **chezmoi**, prioritizing **Windows** first and expanding to **Linux** and **macOS**.
The repository root is the chezmoi source directory (no `.chezmoiroot`).

## Repository Structure

- `.chezmoi.toml.tmpl` — OS/arch detection and Windows `pwsh` shell config for `chezmoi cd`
- `.chezmoiignore` — Excludes repo-only files and OS-specific paths from target deployment
- `.gitattributes` — Enforces `LF` by default and `CRLF` for `.bat`, `.cmd`, `.ps1`
- `AppData/Local/nvim/` — Windows Neovim config (`%LOCALAPPDATA%\nvim`)
- `.config/` — Cross-platform XDG configs (shared across Windows, Linux, macOS)

## Commands

Run these commands from the repository root (or via `chezmoi` on a local machine):

```bash
# Sync with remote before making or pushing changes
git fetch origin
git pull --rebase origin main

# Preview / apply chezmoi changes
chezmoi diff
chezmoi apply

# Verify Neovim Lua syntax (when nvim is available)
nvim --headless "+lua require('config')" +qa
```

## Conventions

### Chezmoi & Cross-Platform
- Add any new repository-only files (docs, license, agent configs) to `.chezmoiignore`.
- Do not blanket-ignore `.config/**` on Windows; many CLI/TUI tools read `~/.config` on Windows. Ignore only specific subpaths when an app differs by OS.
- When extending Neovim to Linux/macOS (`~/.config/nvim`), share Lua modules via chezmoi templates/scripts or symlinks instead of duplicating files.

### Neovim (`AppData/Local/nvim/`)
- **Entry point**: `init.lua` calls `require("config")`.
- **Load order** (`lua/config/init.lua`):
  1. `config.globals` **must** load first so `vim.g.mapleader` and `vim.g.maplocalleader` are set before any keymaps or plugins.
  2. `config.options` loads next.
- **`lua/config/globals.lua`**: Uses `vim.g` (`local g = vim.g`) for leader keys and `netrw` variables (`g:netrw_*`, `g:loaded_netrw*`). Keep commented-out `netrw` reference entries intact; uncomment and edit in place.
- **`lua/config/options.lua`**: Uses `vim.opt` (`local opt = vim.opt`) and lists all `:h option-list` (`quickref.txt`) options in **alphabetical order** with Windows defaults commented out. Do not remove or reorder commented-out reference entries; uncomment and edit in place.
- **`lua/plugins/`**: Reserved for plugin specifications (e.g., `lazy.nvim`).

### Documentation & Language
- **English-only codebase**: Write all code, comments, configuration files, and commit messages in **English only** (`README.KO.md` is the sole exception).
- **`README.md` must be written in English.**
- **`README.KO.md` must be maintained separately in Korean** and kept in sync with `README.md`.
- Link between `README.md` and `README.KO.md` at the top of each file, and ensure both are listed in `.chezmoiignore`.

## Git & Security

- **Sync first**: The user often edits deployed files directly under `~/AppData/Local/nvim` and pushes via `chezmoi re-add` + `chezmoi git`. Always `git fetch` / `git pull --rebase` before committing or pushing.
- **No secrets**: Never commit API keys, tokens, credentials, or machine-specific private paths. Use chezmoi templates (`.tmpl`) for OS- or host-specific differences.
- **Commit style**: Use concise Conventional Commits (e.g., `feat(nvim): ...`, `fix: ...`, `docs: ...`, `chore: ...`).
