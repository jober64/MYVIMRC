"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                             "
"    Generic vimrc, designed for GVim, MacVim and Vim.        "
"                                                             "
"    * JB 2011-2015 *                                         "
"                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"   Basic settings
    set nocompatible
    filetype off
    syntax on

"   Plugins
    silent! source ~/.plugin.vim

"   User interface
    if has ("gui_win32")
        "Windows gvim
        set background=dark
        colorscheme base16-tomorrow
        set guifont=Consolas:h11:cDEFAULT
        set lines=50 columns=120
        set langmenu=en_US.UTF-8
        let $LANG = 'en_US'
    elseif has ("gui_macvim")
        "Mac macvim
        set background=dark
        colorscheme base16-tomorrow
        set guifont=Menlo\ Regular:h14
    else
        "vim
        colorscheme ron
        "hi StatusLine ctermbg=white ctermfg=darkred
        hi StatusLine ctermbg=white ctermfg=darkgrey
    endif

" General settings
    filetype plugin indent on
    set backspace=2
    set ignorecase
    set smartcase
    set number
    set nostartofline
    set hlsearch
    set incsearch
    set laststatus=2
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
    "set ruler
    set statusline=%t%m[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%r%y%=%c:%l/%L\ %P
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

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
        if has ("gui_win32")
            let MyCheatSheet = $VIM . "/vimfiles/doc/help.txt"
        else
            let MyCheatSheet = $HOME . "/.vim/doc/help.txt"
        endif

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
        set viminfo='10,\"100,:20,%,n$VIM/_viminfo
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
 
" Reload .vimrc when saved
    augroup reload_vimrc " {
        autocmd!
        autocmd BufWritePost $MYVIMRC source $MYVIMRC
    augroup END " } 

