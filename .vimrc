" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" :PluginInstall

set nocompatible " be iMproved
filetype off     " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/vundle'

" Vundle packages
" original repos on github
Plugin 'kien/ctrlp.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'junegunn/vim-journal'

call vundle#end()            " required
filetype plugin indent on    " required

" Plugin settings
let g:ctrlp_custom_ignore = '\v[\/](\.git|node_modules|build)$'


" Basics
syntax on
" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048
set number
set showcmd
set autoread
set background=dark

" Visual bell
set vb

" Global tab settings
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Search
set incsearch
set smartcase
set hlsearch

" Directory
let g:netrw_liststyle = 3
let g:netrw_banner = 0

" Turn backups off
set nobackup
set nowb
set noswapfile

" Turn folding off
set nofoldenable

" Map :W to :w and :Q to :q
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev WQ wq
cnoreabbrev Wq wq

" Map netrw to lowercase
cnoreabbrev exp Exp
cnoreabbrev sex Sex
cnoreabbrev vex Vex!

" Map toggle highlighting of lines over 80 characters to \l
nnoremap <silent> <Leader>l
    \ :if exists('w:long_line_match') <Bar>
    \   silent! call matchdelete(w:long_line_match) <Bar>
    \   unlet w:long_line_match <Bar>
    \ elseif &textwidth > 0 <Bar>
    \   let w:long_line_match = matchadd('ErrorMsg', '\%>'.&tw.'v.\+', -1) <Bar>
    \ else <Bar>
    \   let w:long_line_match = matchadd('ErrorMsg', '\%>80v.\+', -1) <Bar>
    \ endif<CR>


" Remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Override indentation by filetype
autocmd FileType html,phtml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType php setlocal expandtab shiftwidth=4 softtabstop=4

" PHP parser check (CTRL-L)
:autocmd FileType php noremap <C-L> :!php -l %<CR>
