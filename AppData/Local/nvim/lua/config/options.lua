-- ============================================================================
-- Neovim Options Reference (:h option-list / quickref.txt)
-- ============================================================================
-- All options below are listed in alphabetical order matching :h option-list
-- with their Neovim (Windows) default values commented out.
-- To customize an option, uncomment the line and modify its value.
-- ============================================================================

local opt = vim.opt

-- 'allowrevins' ('ari') - allow CTRL-_ in Insert mode
-- opt.allowrevins = false

-- 'ambiwidth' ('ambw') - what to do with Unicode chars of ambiguous width
-- opt.ambiwidth = "single"

-- 'arabic' ('arab') - for Arabic as a default second language
-- opt.arabic = false

-- 'arabicshape' ('arshape') - do shaping for Arabic characters
-- opt.arabicshape = true

-- 'autochdir' ('acd') - change directory to the file in the current window
-- opt.autochdir = false

-- 'autocomplete' ('ac') - enable automatic completion in insert mode
-- opt.autocomplete = false

-- 'autocompletedelay' ('acl') - delay in msec before menu appears after typing
-- opt.autocompletedelay = 0

-- 'autocompletetimeout' ('act') - initial decay timeout for autocompletion algorithm
-- opt.autocompletetimeout = 0

-- 'autoindent' ('ai') - take indent for new line from previous line
-- opt.autoindent = true

-- 'autoread' ('ar') - autom. read file when changed outside of Vim
-- opt.autoread = true

-- 'autowrite' ('aw') - automatically write file if changed
-- opt.autowrite = false

-- 'autowriteall' ('awa') - as 'autowrite', but works with more commands
-- opt.autowriteall = false

-- 'background' ('bg') - "dark" or "light", used for highlight colors
-- opt.background = "dark"

-- 'backspace' ('bs') - how backspace works at start of line
-- opt.backspace = { "indent", "eol", "start" }

-- 'backup' ('bk') - keep backup file after overwriting a file
-- opt.backup = false

-- 'backupcopy' ('bkc') - make backup as a copy, don't rename the file
-- opt.backupcopy = "auto"

-- 'backupdir' ('bdir') - list of directories for the backup file
-- opt.backupdir = { ".", vim.fn.stdpath("state") .. "/backup//" }

-- 'backupext' ('bex') - extension used for the backup file
-- opt.backupext = "~"

-- 'backupskip' ('bsk') - no backup for files that match these patterns
-- opt.backupskip = { "/tmp/*", "$TMPDIR/*", "$TMP/*", "$TEMP/*" }

-- 'belloff' ('bo') - do not ring the bell for these reasons
-- opt.belloff = { "all" }

-- 'binary' ('bin') - read/write/edit file in binary mode
-- opt.binary = false

-- 'bomb' - prepend a Byte Order Mark to the file
-- opt.bomb = false

-- 'breakat' ('brk') - characters that may cause a line break
-- opt.breakat = " \t!@*-+;:,./?"

-- 'breakindent' ('bri') - wrapped line repeats indent
-- opt.breakindent = false

-- 'breakindentopt' ('briopt') - settings for 'breakindent'
-- opt.breakindentopt = ""

-- 'browsedir' ('bsdir') - which directory to start browsing in
-- opt.browsedir = "last"

-- 'bufhidden' ('bh') - what to do when buffer is no longer in window
-- opt.bufhidden = ""

-- 'buflisted' ('bl') - whether the buffer shows up in the buffer list
-- opt.buflisted = true

-- 'buftype' ('bt') - special type of buffer
-- opt.buftype = ""

-- 'casemap' ('cmp') - specifies how case of letters is changed
-- opt.casemap = { "internal", "keepascii" }

-- 'cdhome' ('cdh') - change directory to the home directory by ":cd"
-- opt.cdhome = false

-- 'cdpath' ('cd') - list of directories searched with ":cd"
-- opt.cdpath = { "", ",," }

-- 'cedit' - key used to open the command-line window
-- opt.cedit = "<C-F>"

-- 'charconvert' ('ccv') - expression for character encoding conversion
-- opt.charconvert = ""

-- 'chistory' ('chi') - maximum number of quickfix lists in history
-- opt.chistory = 10

-- 'cindent' ('cin') - do C program indenting
-- opt.cindent = false

-- 'cinkeys' ('cink') - keys that trigger indent when 'cindent' is set
-- opt.cinkeys = "0{,0},0),0],:,0#,!^F,o,O,e"

-- 'cinoptions' ('cino') - how to do indenting when 'cindent' is set
-- opt.cinoptions = ""

-- 'cinscopedecls' ('cinsd') - words that are recognized by 'cino-g'
-- opt.cinscopedecls = "public,protected,private"

-- 'cinwords' ('cinw') - words where 'si' and 'cin' add an indent
-- opt.cinwords = "if,else,while,do,for,switch"

-- 'clipboard' ('cb') - use the clipboard as the unnamed register
-- opt.clipboard = ""

-- 'cmdheight' ('ch') - number of lines to use for the command-line
-- opt.cmdheight = 1

-- 'cmdwinheight' ('cwh') - height of the command-line window
-- opt.cmdwinheight = 7

-- 'colorcolumn' ('cc') - columns to highlight
-- opt.colorcolumn = ""

-- 'columns' ('co') - number of columns in the display
-- opt.columns = 80

-- 'comments' ('com') - patterns that can start a comment line
-- opt.comments = "s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-"

-- 'commentstring' ('cms') - template for comments; used for fold marker
-- opt.commentstring = ""

-- 'complete' ('cpt') - specify how Insert mode completion works
-- opt.complete = { ".", "w", "b", "u", "t" }

-- 'completefunc' ('cfu') - function to be used for Insert mode completion
-- opt.completefunc = ""

-- 'completeopt' ('cot') - options for Insert mode completion
-- opt.completeopt = { "menu", "popup" }

-- 'completeslash' ('csl') - like 'shellslash' for completion
-- opt.completeslash = ""

-- 'completetimeout' ('cto') - initial decay timeout for CTRL-N and CTRL-P
-- opt.completetimeout = 0

-- 'concealcursor' ('cocu') - whether concealable text is hidden in cursor line
-- opt.concealcursor = ""

-- 'conceallevel' ('cole') - whether concealable text is shown or hidden
-- opt.conceallevel = 0

-- 'confirm' ('cf') - ask what to do about unsaved/read-only files
-- opt.confirm = false

-- 'copyindent' ('ci') - make 'autoindent' use existing indent structure
-- opt.copyindent = false

-- 'cpoptions' ('cpo') - flags for Vi-compatible behavior
-- opt.cpoptions = "aABceFs_"

-- 'cursorbind' ('crb') - move cursor in window as it moves in other windows
-- opt.cursorbind = false

-- 'cursorcolumn' ('cuc') - highlight the screen column of the cursor
-- opt.cursorcolumn = false

-- 'cursorline' ('cul') - highlight the screen line of the cursor
-- opt.cursorline = false

-- 'cursorlineopt' ('culopt') - settings for 'cursorline'
-- opt.cursorlineopt = { "both" }

-- 'debug' - set to "msg" to see all error messages
-- opt.debug = ""

-- 'define' ('def') - pattern to be used to find a macro definition
-- opt.define = "^\\s*#\\s*define"

-- 'delcombine' ('deco') - delete combining characters on their own
-- opt.delcombine = false

-- 'dictionary' ('dict') - list of file names used for keyword completion
-- opt.dictionary = ""

-- 'diff' - use diff mode for the current window
-- opt.diff = false

-- 'diffanchors' ('dia') - list of {address} to force anchoring of a diff
-- opt.diffanchors = ""

-- 'diffexpr' ('dex') - expression used to obtain a diff file
-- opt.diffexpr = ""

-- 'diffopt' ('dip') - options for using diff mode
-- opt.diffopt = { "internal", "filler", "closeoff", "linematch:40" }

-- 'digraph' ('dg') - enable the entering of digraphs in Insert mode
-- opt.digraph = false

-- 'directory' ('dir') - list of directory names for the swap file
-- opt.directory = { vim.fn.stdpath("state") .. "/swap//" }

-- 'display' ('dy') - list of flags for how to display text
-- opt.display = { "lastline", "msgsep" }

-- 'eadirection' ('ead') - in which direction 'equalalways' works
-- opt.eadirection = "both"

-- 'encoding' ('enc') - encoding used internally
-- opt.encoding = "utf-8"

-- 'endoffile' ('eof') - write CTRL-Z at end of the file
-- opt.endoffile = false

-- 'endofline' ('eol') - write <EOL> for last line in file
-- opt.endofline = true

-- 'equalalways' ('ea') - windows are automatically made the same size
-- opt.equalalways = true

-- 'equalprg' ('ep') - external program to use for "=" command
-- opt.equalprg = ""

-- 'errorbells' ('eb') - ring the bell for error messages
-- opt.errorbells = false

-- 'errorfile' ('ef') - name of the errorfile for the QuickFix mode
-- opt.errorfile = "errors.err"

-- 'errorformat' ('efm') - description of the lines in the error file
-- opt.errorformat = '%f(%l): %t%*[^ ] %n: %m,%f(%l) : %t%*[^ ] %n: %m,%f:%l:%c: %t%*[^:]: %m,%f:%l: %t%*[^:]: %m,"%f", line %l%*[^0-9]%c: %m,"%f", line %l: %m,%f(%l): %m,%f:%l:%c: %m,%f:%l: %m'

-- 'eventignore' ('ei') - autocommand events that are ignored
-- opt.eventignore = ""

-- 'eventignorewin' ('eiw') - autocommand events that are ignored in a window
-- opt.eventignorewin = ""

-- 'expandtab' ('et') - use spaces when <Tab> is inserted
-- opt.expandtab = false

-- 'exrc' ('ex') - read init files in the current directory
-- opt.exrc = false

-- 'fileencoding' ('fenc') - file encoding for multibyte text
-- opt.fileencoding = "utf-8"

-- 'fileencodings' ('fencs') - automatically detected character encodings
-- opt.fileencodings = { "ucs-bom", "utf-8", "default", "latin1" }

-- 'fileformat' ('ff') - file format used for file I/O
-- opt.fileformat = "dos"

-- 'fileformats' ('ffs') - automatically detected values for 'fileformat'
-- opt.fileformats = { "dos", "unix" }

-- 'fileignorecase' ('fic') - ignore case when using file names
-- opt.fileignorecase = true

-- 'filetype' ('ft') - type of file, used for autocommands
-- opt.filetype = ""

-- 'fillchars' ('fcs') - characters to use for displaying special items
-- opt.fillchars = ""

-- 'findfunc' ('ffu') - function to be called for the |:find| command
-- opt.findfunc = ""

-- 'fixendofline' ('fixeol') - make sure last line in file has <EOL>
-- opt.fixendofline = true

-- 'foldclose' ('fcl') - close a fold when the cursor leaves it
-- opt.foldclose = ""

-- 'foldcolumn' ('fdc') - width of the column used to indicate folds
-- opt.foldcolumn = "0"

-- 'foldenable' ('fen') - set to display all folds open
-- opt.foldenable = true

-- 'foldexpr' ('fde') - expression used when 'foldmethod' is "expr"
-- opt.foldexpr = "0"

-- 'foldignore' ('fdi') - ignore lines when 'foldmethod' is "indent"
-- opt.foldignore = "#"

-- 'foldlevel' ('fdl') - close folds with a level higher than this
-- opt.foldlevel = 0

-- 'foldlevelstart' ('fdls') - 'foldlevel' when starting to edit a file
-- opt.foldlevelstart = -1

-- 'foldmarker' ('fmr') - markers used when 'foldmethod' is "marker"
-- opt.foldmarker = "{{{,}}}"

-- 'foldmethod' ('fdm') - folding type
-- opt.foldmethod = "manual"

-- 'foldminlines' ('fml') - minimum number of lines for a fold to be closed
-- opt.foldminlines = 1

-- 'foldnestmax' ('fdn') - maximum fold depth
-- opt.foldnestmax = 20

-- 'foldopen' ('fdo') - for which commands a fold will be opened
-- opt.foldopen = { "block", "hor", "mark", "percent", "quickfix", "search", "tag", "undo" }

-- 'foldtext' ('fdt') - expression used to display for a closed fold
-- opt.foldtext = "foldtext()"

-- 'follow' - multicursor: motions cascade to all cursors
-- opt.follow = false

-- 'formatexpr' ('fex') - expression used with "gq" command
-- opt.formatexpr = ""

-- 'formatlistpat' ('flp') - pattern used to recognize a list header
-- opt.formatlistpat = "^\\s*\\d\\+[\\]:.)}\\t ]\\s*"

-- 'formatoptions' ('fo') - how automatic formatting is to be done
-- opt.formatoptions = "tcqj"

-- 'formatprg' ('fp') - name of external program used with "gq" command
-- opt.formatprg = ""

-- 'fsync' ('fs') - whether to invoke fsync() after file write
-- opt.fsync = false

-- 'grepformat' ('gfm') - format of 'grepprg' output
-- opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"

-- 'grepprg' ('gp') - program to use for ":grep"
-- opt.grepprg = "findstr /n"

-- 'guicursor' ('gcr') - GUI: settings for cursor shape and blinking
-- opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,t:block-blinkon500-blinkoff500-TermCursor"

-- 'guifont' ('gfn') - GUI: Name(s) of font(s) to be used
-- opt.guifont = ""

-- 'guifontwide' ('gfw') - list of font names for double-wide characters
-- opt.guifontwide = ""

-- 'guioptions' ('go') - GUI: Which components and options are used
-- opt.guioptions = ""

-- 'guitablabel' ('gtl') - GUI: custom label for a tabpage
-- opt.guitablabel = ""

-- 'guitabtooltip' ('gtt') - GUI: custom tooltip for a tabpage
-- opt.guitabtooltip = ""

-- 'helpfile' ('hf') - full path name of the main help file
-- opt.helpfile = vim.env.VIMRUNTIME .. "/doc/help.txt"

-- 'helpheight' ('hh') - minimum height of a new help window
-- opt.helpheight = 20

-- 'helplang' ('hlg') - preferred help languages
-- opt.helplang = ""

-- 'hidden' ('hid') - don't unload buffer when it is |abandon|ed
-- opt.hidden = true

-- 'history' ('hi') - number of command-lines that are remembered
-- opt.history = 10000

-- 'hlsearch' ('hls') - highlight matches with last search pattern
-- opt.hlsearch = true

-- 'icon' - let Vim set the text of the window icon
-- opt.icon = false

-- 'iconstring' - string to use for the Vim icon text
-- opt.iconstring = ""

-- 'ignorecase' ('ic') - ignore case in search patterns
-- opt.ignorecase = false

-- 'imcmdline' ('imc') - use IM when starting to edit a command line
-- opt.imcmdline = false

-- 'imdisable' ('imd') - do not use the IM in any mode
-- opt.imdisable = false

-- 'iminsert' ('imi') - use :lmap or IM in Insert mode
-- opt.iminsert = 0

-- 'imsearch' ('ims') - use :lmap or IM when typing a search pattern
-- opt.imsearch = -1

-- 'include' ('inc') - pattern to be used to find an include file
-- opt.include = "^\\s*#\\s*include"

-- 'includeexpr' ('inex') - expression used to process an include line
-- opt.includeexpr = ""

-- 'incsearch' ('is') - highlight match while typing search pattern
-- opt.incsearch = true

-- 'indentexpr' ('inde') - expression used to obtain the indent of a line
-- opt.indentexpr = ""

-- 'indentkeys' ('indk') - keys that trigger indenting with 'indentexpr'
-- opt.indentkeys = "0{,0},0),0],:,0#,!^F,o,O,e"

-- 'infercase' ('inf') - adjust case of match for keyword completion
-- opt.infercase = false

-- 'isfname' ('isf') - characters included in file names and pathnames
-- opt.isfname = "@,48-57,/,\\,.,-,_,+,,,#,$,%,{,},[,],:,@-@,!,~,="

-- 'isident' ('isi') - characters included in identifiers
-- opt.isident = "@,48-57,_,192-255"

-- 'iskeyword' ('isk') - characters included in keywords
-- opt.iskeyword = "@,48-57,_,192-255"

-- 'joinspaces' ('js') - two spaces after a period with a join command
-- opt.joinspaces = true

-- 'jumpoptions' ('jop') - specifies how jumping is done
-- opt.jumpoptions = { "clean" }

-- 'keymap' ('kmp') - name of a keyboard mapping
-- opt.keymap = ""

-- 'keymodel' ('km') - enable starting/stopping selection with keys
-- opt.keymodel = ""

-- 'keywordprg' ('kp') - program to use for the "K" command
-- opt.keywordprg = ":Man"

-- 'langmap' ('lmap') - alphabetic characters for other language mode
-- opt.langmap = ""

-- 'langmenu' ('lm') - language to be used for the menus
-- opt.langmenu = ""

-- 'langremap' ('lrm') - do apply 'langmap' to mapped characters
-- opt.langremap = false

-- 'laststatus' ('ls') - tells when last window has status lines
-- opt.laststatus = 2

-- 'lazyredraw' ('lz') - don't redraw while executing macros
-- opt.lazyredraw = false

-- 'lhistory' ('lhi') - maximum number of location lists in history
-- opt.lhistory = 10

-- 'linebreak' ('lbr') - wrap long lines at a blank
-- opt.linebreak = false

-- 'lines' - number of lines in the display
-- opt.lines = 24

-- 'linespace' ('lsp') - number of pixel lines to use between characters
-- opt.linespace = 0

-- 'lisp' - automatic indenting for Lisp
-- opt.lisp = false

-- 'lispoptions' ('lop') - changes how Lisp indenting is done
-- opt.lispoptions = ""

-- 'lispwords' ('lw') - words that change how lisp indenting works
-- opt.lispwords = "defun,define,defmacro,set!,lambda,if,case,let,flet,let*,letrec,do,do*,define-syntax,let-syntax,letrec-syntax,destructuring-bind,defpackage,defparameter,defstruct,deftype,defvar,do-all-symbols,do-external-symbols,do-symbols,dolist,dotimes,ecase,etypecase,eval-when,labels,macrolet,multiple-value-bind,multiple-value-call,multiple-value-prog1,multiple-value-setq,prog1,progv,typecase,unless,unwind-protect,when,with-input-from-string,with-open-file,with-open-stream,with-output-to-string,with-package-iterator,define-condition,handler-bind,handler-case,restart-bind,restart-case,with-simple-restart,store-value,use-value,muffle-warning,abort,continue,with-slots,with-slots*,with-accessors,with-accessors*,defclass,defmethod,print-unreadable-object"

-- 'list' - show <Tab> and <EOL>
-- opt.list = false

-- 'listchars' ('lcs') - characters for displaying in list mode
-- opt.listchars = { tab = "> ", trail = "-", nbsp = "+" }

-- 'loadplugins' ('lpl') - load plugin scripts when starting up
-- opt.loadplugins = true

-- 'makeef' ('mef') - name of the errorfile for ":make"
-- opt.makeef = ""

-- 'makeencoding' ('menc') - encoding of external make/grep commands
-- opt.makeencoding = ""

-- 'makeprg' ('mp') - program to use for the ":make" command
-- opt.makeprg = "make"

-- 'matchpairs' ('mps') - pairs of characters that "%" can match
-- opt.matchpairs = "(:),{:},[:]"

-- 'matchtime' ('mat') - tenths of a second to show matching paren
-- opt.matchtime = 5

-- 'maxcombine' ('mco') - maximum nr of combining characters displayed
-- opt.maxcombine = 6

-- 'maxfuncdepth' ('mfd') - maximum recursive depth for user functions
-- opt.maxfuncdepth = 100

-- 'maxmapdepth' ('mmd') - maximum recursive depth for mapping
-- opt.maxmapdepth = 1000

-- 'maxmempattern' ('mmp') - maximum memory (in Kbyte) used for pattern search
-- opt.maxmempattern = 1000

-- 'menuitems' ('mis') - maximum number of items in a menu
-- opt.menuitems = 25

-- 'mkspellmem' ('msm') - memory used before |:mkspell| compresses the tree
-- opt.mkspellmem = "460000,2000,500"

-- 'modeline' ('ml') - recognize modelines at start or end of file
-- opt.modeline = true

-- 'modelineexpr' ('mle') - allow setting expression options from a modeline
-- opt.modelineexpr = false

-- 'modelines' ('mls') - number of lines checked for modelines
-- opt.modelines = 5

-- 'modifiable' ('ma') - changes to the text are not possible
-- opt.modifiable = true

-- 'modified' ('mod') - buffer has been modified
-- opt.modified = false

-- 'more' - pause listings when the whole screen is filled
-- opt.more = true

-- 'mouse' - enable the use of mouse clicks
-- opt.mouse = "nvi"

-- 'mousefocus' ('mousef') - keyboard focus follows the mouse
-- opt.mousefocus = false

-- 'mousehide' ('mh') - hide mouse pointer while typing
-- opt.mousehide = true

-- 'mousemodel' ('mousem') - changes meaning of mouse buttons
-- opt.mousemodel = "popup_setpos"

-- 'mousemoveevent' ('mousemev') - report mouse moves with <MouseMove>
-- opt.mousemoveevent = false

-- 'mousescroll' - amount to scroll by when scrolling with a mouse
-- opt.mousescroll = { "ver:3", "hor:6" }

-- 'mouseshape' ('mouses') - shape of the mouse pointer in different modes
-- opt.mouseshape = "i-r:beam,s:updown,sd:udsizing,vs:leftright,vd:lrsizing,m:no,ml:up-arrow,v:rightup-arrow"

-- 'mousetime' ('mouset') - max time between mouse double-click
-- opt.mousetime = 500

-- 'nrformats' ('nf') - number formats recognized for CTRL-A command
-- opt.nrformats = { "bin", "hex" }

-- 'number' ('nu') - print the line number in front of each line
-- opt.number = false

-- 'numberwidth' ('nuw') - number of columns used for the line number
-- opt.numberwidth = 4

-- 'omnifunc' ('ofu') - function for filetype-specific completion
-- opt.omnifunc = ""

-- 'opendevice' ('odev') - allow reading/writing devices on MS-Windows
-- opt.opendevice = false

-- 'operatorfunc' ('opfunc') - function to be called for |g@| operator
-- opt.operatorfunc = ""

-- 'packpath' ('pp') - list of directories used for packages
-- (Managed automatically by Neovim runtimepath / package manager)
-- opt.packpath = {}

-- 'paragraphs' ('para') - nroff macros that separate paragraphs
-- opt.paragraphs = "IPLPPPQPP TPHPLIPpLpItpplpipbp"

-- 'patchexpr' ('pex') - expression used to patch a file
-- opt.patchexpr = ""

-- 'patchmode' ('pm') - keep the oldest version of a file
-- opt.patchmode = ""

-- 'path' ('pa') - list of directories searched with "gf" et.al.
-- opt.path = { ".", "" }

-- 'preserveindent' ('pi') - preserve the indent structure when reindenting
-- opt.preserveindent = false

-- 'previewheight' ('pvh') - height of the preview window
-- opt.previewheight = 12

-- 'previewwindow' ('pvw') - identifies the preview window
-- opt.previewwindow = false

-- 'pumheight' ('ph') - maximum number of items to show in the popup menu
-- opt.pumheight = 0

-- 'pumwidth' ('pw') - minimum width of the popup menu
-- opt.pumwidth = 15

-- 'pyxversion' ('pyx') - Python version used for pyx* commands
-- opt.pyxversion = 3

-- 'quoteescape' ('qe') - escape characters used in a string
-- opt.quoteescape = "\\"

-- 'readonly' ('ro') - disallow writing the buffer
-- opt.readonly = false

-- 'redrawtime' ('rdt') - timeout for 'hlsearch' and |:match| highlighting
-- opt.redrawtime = 2000

-- 'regexpengine' ('re') - default regexp engine to use
-- opt.regexpengine = 0

-- 'relativenumber' ('rnu') - show relative line number in front of each line
-- opt.relativenumber = false

-- 'report' - threshold for reporting nr. of lines changed
-- opt.report = 2

-- 'revins' ('ri') - inserting characters will work backwards
-- opt.revins = false

-- 'rightleft' ('rl') - window is right-to-left oriented
-- opt.rightleft = false

-- 'rightleftcmd' ('rlc') - commands for which editing works right-to-left
-- opt.rightleftcmd = "search"

-- 'ruler' ('ru') - show cursor line and column in the status line
-- opt.ruler = true

-- 'rulerformat' ('ruf') - custom format for the ruler
-- opt.rulerformat = ""

-- 'runtimepath' ('rtp') - list of directories used for runtime files
-- (Managed automatically by Neovim runtime / package manager)
-- opt.runtimepath = {}

-- 'scroll' ('scr') - lines to scroll with CTRL-U and CTRL-D
-- opt.scroll = 0

-- 'scrollbind' ('scb') - scroll in window as other windows scroll
-- opt.scrollbind = false

-- 'scrolljump' ('sj') - minimum number of lines to scroll
-- opt.scrolljump = 1

-- 'scrolloff' ('so') - minimum nr. of lines above and below cursor
-- opt.scrolloff = 0

-- 'scrolloffpad' ('sop') - vertically center cursor at end of file
-- opt.scrolloffpad = false

-- 'scrollopt' ('sbo') - how 'scrollbind' should behave
-- opt.scrollopt = { "ver", "jump" }

-- 'sections' ('sect') - nroff macros that separate sections
-- opt.sections = "SHNHH HUnhsh"

-- 'secure' - secure mode for reading .vimrc in current dir
-- opt.secure = true

-- 'selection' ('sel') - what type of selection to use
-- opt.selection = "inclusive"

-- 'selectmode' ('slm') - when to use Select mode instead of Visual mode
-- opt.selectmode = ""

-- 'sessionoptions' ('ssop') - options for |:mksession|
-- opt.sessionoptions = { "blank", "buffers", "curdir", "folds", "help", "tabpages", "winsize", "terminal" }

-- 'shada' ('sd') - use |shada| file upon startup and exiting
-- opt.shada = "!,'100,<50,s10,h,rA:,rB:"

-- 'shell' ('sh') - name of shell to use for external commands
-- opt.shell = "cmd.exe"

-- 'shellcmdflag' ('shcf') - flag to shell to execute one command
-- opt.shellcmdflag = "/s /c"

-- 'shellpipe' ('sp') - string to put output of ":make" in error file
-- opt.shellpipe = ">%s 2>&1"

-- 'shellquote' ('shq') - quote character(s) for around shell command
-- opt.shellquote = ""

-- 'shellredir' ('srr') - string to put output of filter in a temp file
-- opt.shellredir = ">%s 2>&1"

-- 'shellslash' ('ssl') - use forward slash for shell file names
-- opt.shellslash = false

-- 'shelltemp' ('stmp') - whether to use a temp file for shell commands
-- opt.shelltemp = true

-- 'shellxescape' ('sxe') - characters to escape when 'shellxquote' is (
-- opt.shellxescape = "\"&|<>()@^"

-- 'shellxquote' ('sxq') - like 'shellquote', but include redirection
-- opt.shellxquote = "("

-- 'shiftround' ('sr') - round indent to multiple of shiftwidth
-- opt.shiftround = false

-- 'shiftwidth' ('sw') - number of spaces to use for (auto)indent step
-- opt.shiftwidth = 8

-- 'shortmess' ('shm') - list of flags, reduce length of messages
-- opt.shortmess = "ltToOCF"

-- 'showbreak' ('sbr') - string to use at the start of wrapped lines
-- opt.showbreak = ""

-- 'showcmd' ('sc') - show (partial) command somewhere
-- opt.showcmd = true

-- 'showcmdloc' ('sloc') - where to show (partial) command
-- opt.showcmdloc = "last"

-- 'showfulltag' ('sft') - show full tag pattern when completing tag
-- opt.showfulltag = false

-- 'showmatch' ('sm') - briefly jump to matching bracket if insert one
-- opt.showmatch = false

-- 'showmode' ('smd') - message on status line to show current mode
-- opt.showmode = true

-- 'showtabline' ('stal') - tells when the tabpages line is displayed
-- opt.showtabline = 1

-- 'sidescroll' ('ss') - minimum number of columns to scroll horizontal
-- opt.sidescroll = 1

-- 'sidescrolloff' ('siso') - min. nr. of columns to left and right of cursor
-- opt.sidescrolloff = 0

-- 'signcolumn' ('scl') - when and how to display the sign column
-- opt.signcolumn = "auto"

-- 'smartcase' ('scs') - no ignore case when pattern has uppercase
-- opt.smartcase = false

-- 'smartindent' ('si') - smart autoindenting for C programs
-- opt.smartindent = false

-- 'smarttab' ('sta') - <Tab> in leading whitespace indents by 'shiftwidth'
-- opt.smarttab = true

-- 'smoothscroll' ('sms') - scroll by screen lines when 'wrap' is set
-- opt.smoothscroll = false

-- 'softtabstop' ('sts') - number of columns between two soft tab stops
-- opt.softtabstop = 0

-- 'spell' - enable spell checking
-- opt.spell = false

-- 'spellcapcheck' ('spc') - pattern to locate end of a sentence
-- opt.spellcapcheck = "[.?!]\\_[\\])'\"\\t ]\\+"

-- 'spellfile' ('spf') - files where |zg| and |zw| store words
-- opt.spellfile = ""

-- 'spelllang' ('spl') - language(s) to do spell checking for
-- opt.spelllang = { "en" }

-- 'spelloptions' ('spo') - options for spell checking
-- opt.spelloptions = ""

-- 'spellsuggest' ('sps') - method(s) used to suggest spelling corrections
-- opt.spellsuggest = { "best" }

-- 'splitbelow' ('sb') - new window from split is below the current one
-- opt.splitbelow = false

-- 'splitkeep' ('spk') - determines scroll behavior for split windows
-- opt.splitkeep = "cursor"

-- 'splitright' ('spr') - new window is put right of the current one
-- opt.splitright = false

-- 'startofline' ('sol') - commands move cursor to first non-blank in line
-- opt.startofline = false

-- 'statuscolumn' ('stc') - custom format for the status column
-- opt.statuscolumn = ""

-- 'statusline' ('stl') - custom format for the status line
-- opt.statusline = ""

-- 'suffixes' ('su') - suffixes that are ignored with multiple match
-- opt.suffixes = ".bak,~,.o,.h,.info,.swp,.obj"

-- 'suffixesadd' ('sua') - suffixes added when searching for a file
-- opt.suffixesadd = ""

-- 'swapfile' ('swf') - whether to use a swapfile for a buffer
-- opt.swapfile = true

-- 'switchbuf' ('swb') - sets behavior when switching to another buffer
-- opt.switchbuf = { "uselast" }

-- 'synmaxcol' ('smc') - maximum column to find syntax items
-- opt.synmaxcol = 3000

-- 'syntax' ('syn') - syntax to be loaded for current buffer
-- opt.syntax = ""

-- 'tabclose' ('tcl') - which tabpage to focus when closing a tab
-- opt.tabclose = ""

-- 'tabline' ('tal') - custom format for the console tabpages line
-- opt.tabline = ""

-- 'tabpagemax' ('tpm') - maximum number of tabpages for |-p| and "tab all"
-- opt.tabpagemax = 50

-- 'tabstop' ('ts') - number of columns between two tab stops
-- opt.tabstop = 8

-- 'tagbsearch' ('tbs') - use binary searching in tags files
-- opt.tagbsearch = true

-- 'tagcase' ('tc') - how to handle case when searching in tags files
-- opt.tagcase = "followic"

-- 'tagfunc' ('tfu') - function to get list of tag matches
-- opt.tagfunc = ""

-- 'taglength' ('tl') - number of significant characters for a tag
-- opt.taglength = 0

-- 'tagrelative' ('tr') - file names in tag file are relative
-- opt.tagrelative = true

-- 'tags' ('tag') - list of file names used by the tag command
-- opt.tags = { "./tags;", "tags" }

-- 'tagstack' ('tgst') - push tags onto the tag stack
-- opt.tagstack = true

-- 'term' - name of the terminal
-- (Read-only option, set from $TERM environment variable)

-- 'termbidi' ('tbidi') - terminal takes care of bi-directionality
-- opt.termbidi = false

-- 'termguicolors' ('tgc') - enable 24-bit RGB color in the TUI
-- opt.termguicolors = true

-- 'textwidth' ('tw') - maximum width of text that is being inserted
-- opt.textwidth = 0

-- 'thesaurus' ('tsr') - list of thesaurus files for keyword completion
-- opt.thesaurus = ""

-- 'thesaurusfunc' ('tsrfu') - function to be used for thesaurus completion
-- opt.thesaurusfunc = ""

-- 'tildeop' ('top') - tilde command "~" behaves like an operator
-- opt.tildeop = false

-- 'timeout' ('to') - time out on mappings and key codes
-- opt.timeout = true

-- 'timeoutlen' ('tm') - time out time in milliseconds
-- opt.timeoutlen = 1000

-- 'title' - let Vim set the title of the window
-- opt.title = false

-- 'titlelen' - percentage of 'columns' used for window title
-- opt.titlelen = 85

-- 'titleold' - old title, restored when exiting
-- opt.titleold = ""

-- 'titlestring' - string to use for the Vim window title
-- opt.titlestring = ""

-- 'ttimeout' - time out on mappings
-- opt.ttimeout = true

-- 'ttimeoutlen' ('ttm') - time out time for key codes in milliseconds
-- opt.ttimeoutlen = 50

-- 'ttytype' ('tty') - alias for 'term'
-- (Read-only option, alias for 'term')

-- 'undodir' ('udir') - where to store undo files
-- opt.undodir = { vim.fn.stdpath("state") .. "/undo//" }

-- 'undofile' ('udf') - save undo information in a file
-- opt.undofile = false

-- 'undolevels' ('ul') - maximum number of changes that can be undone
-- opt.undolevels = 1000

-- 'undoreload' ('ur') - max nr of lines to save for undo on a buffer reload
-- opt.undoreload = 10000

-- 'updatecount' ('uc') - after this many characters flush swap file
-- opt.updatecount = 200

-- 'updatetime' ('ut') - after this many milliseconds flush swap file
-- opt.updatetime = 4000

-- 'varsofttabstop' ('vsts') - a list of number of columns between soft tab stops
-- opt.varsofttabstop = ""

-- 'vartabstop' ('vts') - a list of number of columns between tab stops
-- opt.vartabstop = ""

-- 'verbose' ('vbs') - give informative messages
-- opt.verbose = 0

-- 'verbosefile' ('vfile') - file to write messages in
-- opt.verbosefile = ""

-- 'viewdir' ('vdir') - directory where to store files with :mkview
-- opt.viewdir = vim.fn.stdpath("state") .. "/view//"

-- 'viewoptions' ('vop') - specifies what to save for :mkview
-- opt.viewoptions = { "folds", "cursor", "curdir" }

-- 'virtualedit' ('ve') - when to use virtual editing
-- opt.virtualedit = ""

-- 'visualbell' ('vb') - use visual bell instead of beeping
-- opt.visualbell = false

-- 'warn' - warn for shell command when buffer was changed
-- opt.warn = true

-- 'whichwrap' ('ww') - allow specified keys to cross line boundaries
-- opt.whichwrap = "b,s"

-- 'wildchar' ('wc') - command-line character for wildcard expansion
-- opt.wildchar = 9 -- (<Tab>)

-- 'wildcharm' ('wcm') - like 'wildchar' but also works when mapped
-- opt.wildcharm = 0

-- 'wildignore' ('wig') - files matching these patterns are not completed
-- opt.wildignore = ""

-- 'wildignorecase' ('wic') - ignore case when completing file names
-- opt.wildignorecase = false

-- 'wildmenu' ('wmnu') - use menu for command line completion
-- opt.wildmenu = true

-- 'wildmode' ('wim') - mode for 'wildchar' command-line expansion
-- opt.wildmode = { "full" }

-- 'wildoptions' ('wop') - specifies how command line completion is done
-- opt.wildoptions = { "pum", "tagfile" }

-- 'winaltkeys' ('wak') - when the windows system handles ALT keys
-- opt.winaltkeys = "menu"

-- 'window' ('wi') - nr of lines to scroll for CTRL-F and CTRL-B
-- opt.window = 23

-- 'winfixbuf' ('wfb') - keep window focused on a single buffer
-- opt.winfixbuf = false

-- 'winfixheight' ('wfh') - keep window height when opening/closing windows
-- opt.winfixheight = false

-- 'winfixwidth' ('wfw') - keep window width when opening/closing windows
-- opt.winfixwidth = false

-- 'winheight' ('wh') - minimum number of lines for the current window
-- opt.winheight = 1

-- 'winhighlight' ('winhl') - window-local highlighting
-- opt.winhighlight = ""

-- 'winminheight' ('wmh') - minimum number of lines for any window
-- opt.winminheight = 1

-- 'winminwidth' ('wmw') - minimal number of columns for any window
-- opt.winminwidth = 1

-- 'winwidth' ('wiw') - minimal number of columns for current window
-- opt.winwidth = 20

-- 'wrap' - long lines wrap and continue on the next line
-- opt.wrap = true

-- 'wrapmargin' ('wm') - chars from the right where wrapping starts
-- opt.wrapmargin = 0

-- 'wrapscan' ('ws') - searches wrap around the end of the file
-- opt.wrapscan = true

-- 'write' - writing to a file is allowed
-- opt.write = true

-- 'writeany' ('wa') - write to file with no need for "!" override
-- opt.writeany = false

-- 'writebackup' ('wb') - make a backup before overwriting a file
-- opt.writebackup = true

-- 'writedelay' ('wd') - delay this many msec for each char (for debug)
-- opt.writedelay = 0
