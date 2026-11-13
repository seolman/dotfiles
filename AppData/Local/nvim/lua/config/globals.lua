-- ============================================================================
-- Neovim Global Variables (vim.g)
-- ============================================================================
-- Unlike vim.opt (:set), vim.g (:let g:...) sets global variables used by
-- Neovim mappings (mapleader) and built-in/external plugins (e.g., netrw).
-- Must be loaded BEFORE keymaps and plugins.
-- ============================================================================

local g = vim.g

-- ============================================================================
-- 1. Leader Keys (:h mapleader, :h maplocalleader)
-- ============================================================================
-- Default in Neovim is "\" (backslash). Space (" ") is set as leader below.
g.mapleader = " "
g.maplocalleader = " "

-- ============================================================================
-- 2. Netrw Built-in File Explorer (:h netrw-var)
-- ============================================================================
-- All netrw variables below are commented out with their default values.
-- Uncomment and change values as needed.

-- [Disable Netrw Completely]
-- Uncomment the two lines below if you use an external file explorer plugin
-- (e.g., neo-tree.nvim, nvim-tree.lua, oil.nvim) to prevent netrw from loading:
-- g.loaded_netrw = 1
-- g.loaded_netrwPlugin = 1

-- 'g:netrw_altfile' - 0: normal, 1: keep alternate file (#) as the last edited file (not netrw buffer)
-- g.netrw_altfile = 0

-- 'g:netrw_alto' - 0: use 'splitbelow', 1: invert splitting direction for 'o'
-- g.netrw_alto = 0

-- 'g:netrw_altv' - 0: use 'splitright', 1: invert splitting direction for 'v'
-- g.netrw_altv = 0

-- 'g:netrw_banner' - 1: show top help banner, 0: hide banner (press 'I' to toggle)
-- g.netrw_banner = 1

-- 'g:netrw_browse_split' - how <CR> opens files:
--   0: reuse the same window
--   1: horizontally split window
--   2: vertically split window
--   3: open in a new tab
--   4: open in previous window (like 'P')
-- g.netrw_browse_split = 0

-- 'g:netrw_bufsettings' - buffer options applied to netrw buffers
-- g.netrw_bufsettings = "noma nomod nonu nobl nowrap ro rnu"

-- 'g:netrw_chgwin' - window number where files opened from netrw will be placed (-1 = disabled)
-- g.netrw_chgwin = -1

-- 'g:netrw_compress' - program used to compress files with 'z' map
-- g.netrw_compress = "gzip"

-- 'g:netrw_ctags' - external ctags program
-- g.netrw_ctags = "ctags"

-- 'g:netrw_cursor' - control 'cursorline' / 'cursorcolumn' in netrw buffers (default 2: keep cursorline)
-- g.netrw_cursor = 2

-- 'g:netrw_cygwin' - on Windows, 1 if using cygwin scp/ssh, 0 otherwise
-- g.netrw_cygwin = 0

-- 'g:netrw_dirhistmax' - maximum number of directories kept in history (0 to disable .netrwhist)
-- g.netrw_dirhistmax = 10

-- 'g:netrw_ErrorMsg' - error message severity level (0, 1, 2)
-- g.netrw_ErrorMsg = 1

-- 'g:netrw_fastbrowse' - directory browsing speed vs accuracy:
--   0: slow (always re-obtain directory listing)
--   1: medium (reuse unseen directory listings, refresh current)
--   2: fast (only obtain directory listings when not seen before)
-- g.netrw_fastbrowse = 1

-- 'g:netrw_ftp_cmd' - command used for ftp transfers
-- g.netrw_ftp_cmd = "ftp"

-- 'g:netrw_hide' - filtering mode (press 'a' to cycle):
--   0: show all files
--   1: show not-hidden files (hide files matching g:netrw_list_hide)
--   2: show hidden files only
-- g.netrw_hide = 0

-- 'g:netrw_home' - directory where bookmarks (.netrwbook) and history (.netrwhist) are saved
-- g.netrw_home = vim.fn.stdpath("data")

-- 'g:netrw_keepdir' - 1: keep current directory immune from browsing directory, 0: sync current directory with browsing directory
-- g.netrw_keepdir = 1

-- 'g:netrw_list_hide' - comma-separated pattern list for hiding files (e.g., "^\\..*,\\.swp$")
-- g.netrw_list_hide = ""

-- 'g:netrw_liststyle' - directory listing view style (press 'i' to cycle):
--   0: thin listing (one file per line)
--   1: long listing (one file per line with timestamp and file size)
--   2: wide listing (multiple files in columns)
--   3: tree style listing
-- g.netrw_liststyle = 0

-- 'g:netrw_localcopycmd' - external command used to copy files locally (Windows default: expand("$COMSPEC") .. " /c copy")
-- g.netrw_localcopycmd = vim.env.COMSPEC .. " /c copy"

-- 'g:netrw_localcopydircmd' - external command used to copy directories locally (Windows default: expand("$COMSPEC") .. " /c xcopy")
-- g.netrw_localcopydircmd = vim.env.COMSPEC .. " /c xcopy"

-- 'g:netrw_localmkdir' - external command used to create directories (only if vim.fn.mkdir is unavailable)
-- g.netrw_localmkdir = vim.env.COMSPEC .. " /c mkdir"

-- 'g:netrw_localmovecmd' - external command used to move/rename files locally (Windows default: expand("$COMSPEC") .. " /c move")
-- g.netrw_localmovecmd = vim.env.COMSPEC .. " /c move"

-- 'g:netrw_localrmdir' - external command used to remove empty directories (only if delete() is unavailable)
-- g.netrw_localrmdir = vim.env.COMSPEC .. " /c rmdir"

-- 'g:netrw_maxfilenamelen' - maximum file name length in long listing before alignment wraps
-- g.netrw_maxfilenamelen = 32

-- 'g:netrw_menu' - 1: enable netrw top GUI menu, 0: disable
-- g.netrw_menu = 1

-- 'g:netrw_nogx' - if set to 1, disables default 'gx' mapping (open URL/file under cursor)
-- g.netrw_nogx = 0

-- 'g:netrw_preview' - 0: horizontal split for preview ('p'), 1: vertical split for preview
-- g.netrw_preview = 0

-- 'g:netrw_retmap' - 1: map <2-LeftMouse> to return to netrw listing from file
-- g.netrw_retmap = 0

-- 'g:netrw_scp_cmd' - external scp command
-- g.netrw_scp_cmd = "scp -q"

-- 'g:netrw_sftp_cmd' - external sftp command
-- g.netrw_sftp_cmd = "sftp"

-- 'g:netrw_silent' - 0: transfers done normally, 1: transfers done silently
-- g.netrw_silent = 0

-- 'g:netrw_sizestyle' - how file sizes are displayed in long listing:
--   "b": bytes
--   "h": human-readable (K, M, G) with 1000 base
--   "H": human-readable (Ki, Mi, Gi) with 1024 base
-- g.netrw_sizestyle = "b"

-- 'g:netrw_sort_by' - sort listing by: "name", "time", or "size", "exten" (press 's' to cycle)
-- g.netrw_sort_by = "name"

-- 'g:netrw_sort_direction' - "normal" (ascending) or "reverse" (descending) (press 'r' to toggle)
-- g.netrw_sort_direction = "normal"

-- 'g:netrw_sort_options' - options passed to sort (e.g., "i" for case-insensitive sorting)
-- g.netrw_sort_options = ""

-- 'g:netrw_sort_sequence' - priority patterns when sorting by name (directories first by default)
-- g.netrw_sort_sequence = "[\\/]$,*,\\.bak$,\\.o$,\\.h$,\\.info$,\\.swp$,\\.obj$"

-- 'g:netrw_special_syntax' - 1: highlight special file types (executables, symlinks, etc.) in listing
-- g.netrw_special_syntax = 0

-- 'g:netrw_ssh_cmd' - external ssh command
-- g.netrw_ssh_cmd = "ssh"

-- 'g:netrw_timefmt' - strftime() format string for long listing timestamps
-- g.netrw_timefmt = "%c"

-- 'g:netrw_use_errorwindow' - 0: use echoerr, 1: use separate error window, 2: use popup window
-- g.netrw_use_errorwindow = 1

-- 'g:netrw_winsize' - initial size (percentage) of new netrw split windows (negative = exact lines/cols)
-- g.netrw_winsize = 50

-- 'g:netrw_wiw' - minimum window width for netrw windows
-- g.netrw_wiw = 1
