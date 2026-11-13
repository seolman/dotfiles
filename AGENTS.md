# AGENTS.md

Guidelines for AI coding agents working in this repository.

## Repository Overview

This is a cross-platform dotfiles repository managed with **chezmoi**, prioritizing **Windows** first and expanding to **Linux** and **macOS**.
The repository root itself is the chezmoi source directory (no `.chezmoiroot` subdirectory).

## Directory & Platform Conventions

- **Chezmoi metadata**:
  - `.chezmoi.toml.tmpl`: Evaluates OS/arch data and configures `pwsh` for `chezmoi cd` on Windows.
  - `.chezmoiignore`: Excludes repository-only files (`README.md`, `LICENSE.md`, `AGENTS.md`) from the target home directory and ignores `AppData/**` on non-Windows systems. **Always add any new repo-only documentation or tooling files to `.chezmoiignore`.**
  - `.gitattributes`: Enforces `LF` line endings by default and `CRLF` for `.bat`, `.cmd`, and `.ps1`.
- **Cross-platform configs (`.config/`)**:
  - Do not blanket-ignore `.config/**` on Windows; many CLI/TUI tools (e.g., WezTerm, Starship, lazygit, gh) read `~/.config` on Windows as well as Unix. Exclude only specific paths if an app differs on Windows.
- **Windows Neovim (`AppData/Local/nvim/`)**:
  - Maps to `~/AppData/Local/nvim` (`%LOCALAPPDATA%\nvim`) on Windows.
  - When extending Neovim support to Linux/macOS (`~/.config/nvim`), prefer sharing Lua modules via chezmoi templates/scripts or symlinks rather than duplicating config files.

## Neovim Configuration Conventions

- **Entry point**: `AppData/Local/nvim/init.lua` loads `require("config")`.
- **Load order** (`AppData/Local/nvim/lua/config/init.lua`):
  1. `config.globals` **must** load first before options, keymaps, or plugins so `vim.g.mapleader` and `vim.g.maplocalleader` are set prior to any mappings.
  2. `config.options` loads next.
- **`globals.lua`**:
  - Uses `vim.g` (`local g = vim.g`) for leader keys and built-in plugin variables such as `netrw` (`g:netrw_*`, `g:loaded_netrw*`).
  - Keep the commented-out `netrw` reference entries intact; uncomment and adjust values as needed.
- **`options.lua`**:
  - Uses `vim.opt` (`local opt = vim.opt`) instead of `vim.o` so list/map options can be written as Lua tables and modified with `:append()` / `:remove()`.
  - Contains the full `:h option-list` (`quickref.txt`) in **alphabetical order** with Windows Neovim defaults commented out. **Do not remove or reorder commented-out reference options**; customize by uncommenting and editing in place.
- **`lua/plugins/`**:
  - Placeholder for plugin specifications (e.g., `lazy.nvim`).

## Git & Chezmoi Workflow Rules

- **Sync before editing/pushing**: The user frequently edits deployed files directly under `~/AppData/Local/nvim` and pushes via `chezmoi re-add` + `chezmoi git`. Run `git fetch` / `git pull --rebase` before committing or pushing to avoid conflicts.
- **No secrets**: Never commit API keys, tokens, credentials, or machine-specific private paths. Use chezmoi templates (`.tmpl`) for OS- or host-specific differences.
- **Commit style**: Use concise Conventional Commits (e.g., `feat(nvim): ...`, `fix: ...`, `chore: ...`, `docs: ...`).
