" first install vundle. visit the github page
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'scrooloose/nerdtree'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bitc/vim-bad-whitespace'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'morhetz/gruvbox'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Show line numbers
set number

" Simple pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" change default split location
set splitbelow
set splitright

" python PEP8 indentation
au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix

" jump to previous location
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
endif

" Nerdtree commands

" Open nerdtree automatically
autocmd vimenter * NERDTree

" Move cursor to editing area
autocmd VimEnter * wincmd p

" Close vim if nerdtree is the only thing left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open nerdtree on the right
let g:NERDTreeWinPos = "right"


" Gruvbox colorscheme
" enable dark mode
set t_Co=256
set background=dark
colorscheme gruvbox
syntax enable


" Simpylfold

" show docstrings in preview
let g:SimpylFold_docstring_preview=1

" don't fold docstrings
let g:SimpylFold_fold_docstring=0
let b:SimpylFold_fold_docstring=0

" don't fold imports
let g:SimpylFold_fold_import=0
let b:SimpylFold_fold_import=0


" YouCompleteMe

" Auto close completion window
let g:ycm_autoclose_preview_window_after_completion=1


" Syntastic

" Ignore line length errors
let g:syntastic_python_flake8_args='--ignore=E501'
