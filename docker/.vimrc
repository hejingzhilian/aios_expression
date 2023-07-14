set encoding=utf-8
filetype off
set expandtab
set tabstop=2
set shiftwidth=4
set autoindent
set softtabstop=2
set smarttab
set completeopt=menu
set backspace=indent,eol,start
 set rtp+=~/.vim/bundle/Vundle.vim 
call vundle#begin() 
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/a.vim'
Plugin 'jiangmiao/auto-pairs'

call vundle#end()     
filetype plugin indent on
syntax on
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_max_diagnostics_to_display = 0 

nmap <c-i> :YcmCompleter GoToInclude<CR>  
nmap <c-m> :YcmCompleter GoToImprecise<CR>
nmap <c-l> :YcmCompleter GoToReferences<CR>
nmap <c-k> :YcmCompleter GoToDefinition<CR>
nmap <c-f> :YcmCompleter FixIt<CR>
