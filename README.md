# dotfiles

[English](README.md) | [한국어](README.KO.md)

Cross-platform dotfiles managed with **chezmoi**, prioritizing **Windows** first and expanding to **Linux** and **macOS**.

## Directory Structure

```text
.
├── .chezmoi.toml.tmpl          # chezmoi config template (OS detection & Windows shell)
├── .chezmoiignore              # Excluded files and OS-specific paths
├── .gitattributes              # Cross-platform line endings (LF/CRLF)
├── AGENTS.md                   # Guidelines for AI coding agents
├── LICENSE.md                  # MIT License
├── README.md                   # Documentation (English)
├── README.KO.md                # Documentation (Korean)
├── AppData/
│   └── Local/
│       └── nvim/               # Windows Neovim config (%LOCALAPPDATA%\nvim)
│           ├── init.lua
│           ├── nvim-pack-lock.json
│           └── lua/
│               ├── config/
│               │   ├── init.lua
│               │   ├── globals.lua
│               │   ├── options.lua
│               │   └── lsp.lua
│               └── plugins/
│                   └── init.lua
└── dot_config/
    └── tmux/
        └── tmux.conf           # Linux tmux config (~/.config/tmux/tmux.conf)
```

---

## Neovim (Windows — Native `vim.pack` & Hybrid LSP)

Configured for **Neovim 0.13** using the built-in package manager (`vim.pack`) with [`neovim/nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig), [`mason-org/mason.nvim`](https://github.com/mason-org/mason.nvim), and native `vim.lsp.config` / `vim.lsp.enable` APIs.

- **System-first Hybrid Mason (`PATH = "append"`)**: Prefers language servers already installed on the system (e.g., via `rustup`, `winget`, `brew`, `apt`) and automatically installs missing servers via Mason (`:Mason` to inspect).
- **Enabled language servers**: `lua_ls`, `ts_ls`, `basedpyright`, `clangd`, `rust_analyzer`, `gopls`, `marksman`, `markdown_oxide`
- **Native features enabled on `LspAttach`**:
  - Auto-completion via `vim.lsp.completion.enable(..., { autotrigger = true })` (`<C-n>` / `<C-p>` to navigate, `<C-y>` to confirm)
  - Inlay hints via `vim.lsp.inlay_hint.enable(true)` (`grh` to toggle per buffer)
- **Package management commands (`vim.pack`)**:
  - `:packupdate` — Download and review plugin updates (`:write` to confirm, `:quit` to abort)
  - `:packupdate ++offline` — Inspect installed plugins offline
  - `:packdel <name>` / `:packdel ++all` — Remove inactive plugins

| Keybinding | Mode | Action |
| :--- | :--- | :--- |
| `grn` | Normal | Rename symbol (`vim.lsp.buf.rename()`) |
| `gra` | Normal / Visual | Code action (`vim.lsp.buf.code_action()`) |
| `grr` | Normal | Find references (`vim.lsp.buf.references()`) |
| `gri` | Normal | Go to implementation (`vim.lsp.buf.implementation()`) |
| `grt` | Normal | Go to type definition (`vim.lsp.buf.type_definition()`) |
| `grx` | Normal | Run CodeLens (`vim.lsp.codelens.run()`) |
| `grh` | Normal | Toggle Inlay Hints (`vim.lsp.inlay_hint`) |
| `gO` | Normal | Document symbols (`vim.lsp.buf.document_symbol()`) |
| `gd` | Normal | Go to definition (`vim.lsp.buf.definition()`) |
| `gD` | Normal | Go to declaration (`vim.lsp.buf.declaration()`) |
| `K` | Normal | Hover documentation (`vim.lsp.buf.hover()`) |
| `<C-]>` / `<C-w>]` | Normal | Go to definition / Split & go to definition (`tagfunc`) |
| `<C-s>` | Insert / Select | Signature help (`vim.lsp.buf.signature_help()`) |
| `gq` | Normal / Visual | Format selection/lines (`formatexpr`) |
| `]d` / `[d` | Normal | Next / Previous diagnostic |
| `<C-w>d` | Normal | Show diagnostic float under cursor |

---

## tmux (Linux)

Pure built-in tmux configuration with Vim motions, zero external plugins, TrueColor/Neovim support, and a transparent top status bar (`~/.config/tmux/tmux.conf`).

> **Note**: Remove `~/.tmux.conf` if it exists so tmux loads `~/.config/tmux/tmux.conf` automatically. For local clipboard integration outside OSC 52 terminals, install `wl-clipboard` (Wayland) or `xclip`/`xsel` (X11).

| Keybinding | Action |
| :--- | :--- |
| `Ctrl-g` | Prefix key (`Ctrl-g Ctrl-g` sends literal `Ctrl-g`) |
| `Prefix` + `v` / `s` | Vertical split (side-by-side) / Horizontal split (top/bottom) |
| `Prefix` + `h` / `j` / `k` / `l` | Move focus between panes |
| `Prefix` + `H` / `J` / `K` / `L` | Resize pane by 5 cells (repeatable) |
| `Prefix` + `c` / `Tab` / `S` | New window (current path) / Last window / Session tree |
| `Prefix` + `M-h` / `M-l` | Swap window left / right |
| `Prefix` + `[` or `Esc` | Enter Vi copy mode (`v` char, `V` line, `C-v` block, `y` yank) |
| `Prefix` + `r` | Reload `~/.config/tmux/tmux.conf` |

---

## Usage (Chezmoi Workflow)

### 1. Initial Setup (First Time)

```powershell
chezmoi init --apply https://github.com/seolman/dotfiles.git
```

### 2. Pull & Apply Remote Updates

Fetch changes from GitHub into `~/.local/share/chezmoi` and apply them to your home directory (e.g., `~/AppData/Local/nvim`):

```powershell
# Preview remote changes
chezmoi git -- fetch
chezmoi diff

# Run git pull + chezmoi apply in one step
chezmoi update
```

### 3. Sync Local Edits Back to Chezmoi

When you edit deployed files directly (e.g., inside `~/AppData/Local/nvim`) instead of `~/.local/share/chezmoi`, sync them back using `re-add` or `add`:

```powershell
# Check differences between local files and chezmoi source
chezmoi status
chezmoi diff

# [Option A] Update already-managed files in chezmoi source (recommended)
chezmoi re-add

# [Option B] Add newly created files or specific paths to chezmoi
chezmoi add ~/AppData/Local/nvim
# Or a specific file:
# chezmoi add ~/AppData/Local/nvim/lua/config/options.lua
```

> **Tip**: You can also edit source files directly with `chezmoi edit ~/AppData/Local/nvim/init.lua` and then run `chezmoi apply`.

### 4. Commit & Push Changes (`chezmoi git`)

After running `chezmoi re-add` or `chezmoi add`, commit and push from the chezmoi source directory:

#### Option A: Run `chezmoi git` from anywhere (recommended)

```powershell
chezmoi git -- status
chezmoi git -- add .
chezmoi git -- commit -m "chore(nvim): update options"
chezmoi git -- push
```

#### Option B: Enter the source directory with `chezmoi cd`

```powershell
chezmoi cd
git status
git add .
git commit -m "chore(nvim): update options"
git push
exit
```
