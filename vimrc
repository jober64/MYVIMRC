"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                             "
"    Generic vimrc, designed for GVim, MacVim and Vim.        "
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
        set langmenu=en_US.UTF-8
        let $LANG = 'en_US'
    elseif has ("gui_macvim")
        "Mac macvim
        let g:solarized_termcolors=256
        set background=light
        let g:solarized_menu=0
        colorscheme solarized
        set guifont=Menlo\ Regular:h14
    else
        "vim
        "Use 'ron' for black background
        "colorscheme ron 

        "Use Solarized color scheme when available
        set t_Co=256
        set background=light
        colorscheme solarized
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
    nnoremap Q :call ToggleCheatSheet()<cr>
 
" Toggle Cheat Sheet
    function! ToggleCheatSheet()
        let MyCheatSheet = ".vim/doc/help.markdown"
        if bufloaded(MyCheatSheet)
            execute "bdelete " . MyCheatSheet
        else
            execute "botright vsplit " . MyCheatSheet 
            setlocal ro
            setlocal nonumber
        endif
    endfunction

" Open files from last session and remember last positions
    if has ("gui_win32")
        "Special path for gvim in NOW/Windows
        set viminfo='10,\"100,:20,%,n$VINRUNTIME/Vim/_viminfo
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
 
