"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                             "
"    Generic vimrc, designed for GVim, MacVim and Vim. No     "
"    plug-ins required, but the Solarized color scheme must   "
"    be installed in Gvim and MacVim.                         "
"                                                             "
"    Cheat sheet with custom mappings in the end of the file. "
"                                                             "
"    * JB 2011-2015 *                                         "
"                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 
"   User interface
    if has ("gui_win32")
        "Windows gvim
        let g:solarized_termcolors=256
        set background=dark
        let g:solarized_menu=0
        colorscheme solarized
        set guifont=Consolas:h10:cDEFAULT
        set lines=50 columns=120
    elseif has ("gui_macvim")
        "Mac macvim
        let g:solarized_termcolors=256
        set background=light
        let g:solarized_menu=0
        colorscheme solarized
        set guifont=Menlo\ Regular:h14
    else
        "Terminal session
        "Use 'ron' for black background and 'default' for white
        "colorscheme default
        colorscheme ron 
    endif

" General settings
    syntax on
    set nocompatible
    set title
    "The backspace setting need to changed depending on
    "which terminal you are using.
    set backspace=2
    set ignorecase
    set smartcase
    set nonumber
    set nostartofline
    set hlsearch
    set incsearch
    set laststatus=2
    set ruler
    set hidden
    set encoding=utf-8
    set shortmess+=I
    set scrolloff=5
    set wildmenu
    set showcmd
    set autoindent
    set shiftwidth=4
    set softtabstop=4
    set expandtab
    set number
    set nowrap
    set wildmenu
    set wildmode=full
    set wildchar=<tab>
    set wildcharm=<c-z>
    "set undofile
    "set undodir=~/.vim/undo//
    set nobackup
    "set backupdir=~/.vim/backup//
    "set directory=~/.vim/swap//

" Shortcuts
" Optimized for Swedish keyboards
    nnoremap . :
    vnoremap . :
    let mapleader = ","
    nnoremap ! :!
    inoremap jk <esc>
    nnoremap <c-l> :nohl<cr><c-l>
    nnoremap <c-j> :bn<cr>
    nnoremap <c-k> :bN<cr>
    nnoremap <leader>bn :bn<cr>
    nnoremap <leader>bb :bN<cr>
    nnoremap <leader>bd :bd<cr>
    nnoremap <leader>be :enew<cr>
    nnoremap <F2> :set number! paste! paste?<CR>
    nnoremap <F3> :%s/foo/bar/gc
    nnoremap <F4> :Explore<cr>
    nnoremap <F10> .
    nnoremap <tab> :buffers<CR>:buffer<Space>
 
" Open files from last session and remember last positions
    if has ("gui_win32")
        "Special path for gvim in Windows
        set viminfo='10,\"100,:20,%,nC:/Program\ Files\ (x86)/Vim/_viminfo
    else
        "Standard
        set viminfo='10,\"100,:20,%,n~/.viminfo
    endif
 
    function! ResCur()
        if line("'\"") <= line("$")
            normal! g`"
            return 1
        endif
    endfunction
 
    augroup resCur
        autocmd!
        autocmd BufWinEnter * call ResCur()
    augroup END
 
" experimental
"   set statusline=%m         " Modified
"   set statusline+=%r        " Read only
"   set statusline+=%F        " Path to the file
"   set statusline+=%=        " Switch to the right side
"   set statusline+=%l        " Current line
"   set statusline+=/         " Separator
"   set statusline+=%L        " Total lines
"
"   set noruler
"   set statusline=%F[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
 
" Cheat sheet
"
"    START VIM
"    vim <file1> <file2>               Open files in buffers, show first
"    vim -o <file1> <file2>            In horisontal split
"    vim -O <file1> <file2>            In vertical split
"    vim -p <file1> <file2>            In tabs
"  
"    INFO
"    Ctrl-g                          See file and position
"    Ctrl-l                          Redraw (Remapped to turn off highlights)
"    q:                              Command line window
"   
"    NAVIGATION
"    Arrows,h,j,k,l                  Left, down, up, right
"    0                               First character on current line
"    $                               Last character on current line
"    w                               One word right
"    W                               Same, skip special characters
"    e                               One word right, stop on last character
"    E                               Same, skip special characters
"    b                               One word left
"    B                               Same, skip special characters
"    H                               First line on screen
"    M                               Middle line on screen
"    L                               Last line on screen
"    Ctrl+f                          Forward one screen
"    Ctrl+b                          Backward one screen
"    Ctrl+d                          Forward half screen
"    Ctrl+u                          Backward half screen
"    gg                              First line of buffer
"    G                               Last line of buffer
"    <number>gg                      Go to line <number>
"   
"    BUFFERS
"    :e <fil>                        Open file
"    :e!                             Re-open file, trash changes
"    :w                              Save file
"    :wa                             Save all files
"    :sav <fil>                      Save as, continue in new
"    :ls                             List buffers
"    :enew                           New empty buffer in current window
"    :new                            New empty buffer in horisontal window
"    :vnew                           New empty buffer in vertical window
"    :badd <fil>                     New named buffer
"    :bn                             Next buffer
"    :bN                             Previous buffer
"    :b<x>                           Go to buffer <x>
"    :ball                           Show all buffers in windows
"    :bd                             Close saved buffer
"    :bd!                            Close buffer, do not save
"    <F5>                            Go to buffer (Remapped)
"   
"    WINDOWS
"    Ctrl-w s                        Horisontal split
"    Ctrl-w v                        Vertical split
"    Ctrl-w w                        Jump between windows
"    Ctrl-w <arrows>                  Navigate between windows
"    Ctrl-w c                        Close window
"    Ctrl-w q                        Close window including last
"    :q                              Same
"    :q!                             Same, do not save
"    :split <file>                   Open file in horisontal window
"    :vsplit <file>                  Open file in vertical window
"   
"    EDITING
"    i                               Insert before marker
"    a                               Insert after marker
"    o                               Insert after line
"    O                               Insert before line
"    I                               Insert, beginning of line
"    A                               Insert, end of line
"    u                               Undo
"    Ctrl-r                          Redo
"    p                               Paste after marker
"    P                               Paste before marker
"    r                               Replace character (Remapped from '.')
"    cw                              Replace word
"    dd                              Delete line
"    dw                              Delete word
"    d$                              Delete to end of line
"    D                               Delete to end of line
"    C                               Change to end of line
"    dG                              Delete to en of file
"    x                               Delete character
"    J                               Join two lines
"    Ctrl-r 0                        Paste yank register in insert/command mode
"    "0p                             Paste yank register after marker
"    <F2>                            Pastemode (Remapped)
"   
"    VISUAL EDITING
"    v                               Visual selection
"    Ctrl-v                          Visual block selection
"    Shift-v                         Visual line selection
"    d                               Delete text in selection
"    y                               Yank/copy text in selection
"    gv                              Prvious selection
"   
"    SEARCH AND REPLACE
"    *                               Search forwards using current word
"    #                               Search backwards using current word
"    / <foo>                         Search forward for <foo>
"    ? <foo>                         Search forward for <foo>
"    n                               Repeat search forwards
"    N                               Repeat search backwards
"    :s/foo/bar/g                    Change every 'foo' to 'bar' in current line
"    :s/foo/bar/gc                   Change every 'foo' to 'bar' in current line, confirm
"    :%s/foo/bar/g                   Change every 'foo' to 'bar' in every line
"    :%s/foo/bar/gc                  Change every 'foo' to 'bar' in every line, confirm
"    :'<,'>s/foo/bar/g               Same, within a selection
"    <F3>                            Search/replace shortcut   
"   
"    TABS
"    :tabnew                         New tab
"    :tabclose                       Close current tab
"    gt                              Go to next tab
"    gT                              Go to previous tab
"   
"    FOLDS
"    zc                              Close current fold
"    zR                              Open all folds
"    zM                              Close all folds
"    zv                              Expand folds to reveal cursor
"
"    REGISTERS
"    0                               Yank register
"    1 to 9                          Shifting delete registers
"    "                               Default register
"    a to z                          Named registers
"    _                               Black hole register (/dev/null)
"    -                               Small delete register
"    /                               Search pattern register
"    :                               Last command register
"    + and *                         System clipboard registers
"    %                               Current buffer register
"    #                               Previous buffer register
"    :registers                      See register contents 
