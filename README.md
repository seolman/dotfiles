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
└── AppData/
    └── Local/
        └── nvim/               # Windows Neovim config (%LOCALAPPDATA%\nvim)
            ├── init.lua
            └── lua/
                ├── config/
                │   ├── init.lua
                │   ├── globals.lua
                │   └── options.lua
                └── plugins/
                    └── init.lua
```

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
