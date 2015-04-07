set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
call vundle#end()

" CtrlP settings
let g:ctrlp_working_path_mode = 'c'
set wildignore+=*/Library/*,*/Pictures/*,*/Downloads/*,*/Movies/*,*/Music/*,*/Applications/*
