"
" vimrc file setup mainly for python development
"

" Use Vim settings, rather than Vi settings (much better!) (from default).
if &compatible
  set nocompatible
endif

" Reset compatible only when the +eval feature is missing (from default).
silent! while 0
  set nocompatible
silent! endwhile

" Allow backspacing over everything in insert mode (from default).
set backspace=indent,eol,start

" Change leader key
let mapleader = " "

" Also from default
set history=200		" keep 200 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set wildmenu		" display completion matches in a status line
set ttimeout		" time out for key codes
set ttimeoutlen=100	" wait up to 100ms after Esc for special key
set display=truncate
set nrformats-=octal
if has('reltime')
  set incsearch
endif
map Q gq
inoremap <C-U> <C-G>u<C-U>

" Load plugins with vim-plugged
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

" Python
Plug 'tmhedberg/SimpylFold'
Plug 'Konfekt/FastFold'
Plug 'vim-scripts/indentpython.vim' " Better python indentation
Plug 'ycm-core/YouCompleteMe' 	    " Autocomplete
Plug 'dense-analysis/ale'	    " Syntax
Plug 'nvie/vim-flake8'		    " formatting

" LaTeX
Plug 'lervag/vimtex'


" Color scheme
Plug 'dracula/vim', { 'as': 'dracula' }

" File Browser
Plug 'scrooloose/nerdtree'

" Tag management
Plug 'ludovicchabant/vim-gutentags'

" tpope plugins
Plug 'tpope/vim-surround'   " Surround text with quotes or brackets
Plug 'tpope/vim-fugitive'   " Git
Plug 'tpope/vim-commentary' " Commenti commands

" Nicer status bar
"Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}  " If powerline for vim only
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'


call plug#end()

" include everything recursively for searches
set path+=**

" Default split locations
set splitbelow
set splitright

" Disable automatic comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Easily scroll next window
nnoremap <C-j> <C-w>w<C-e><C-w>w
nnoremap <C-k> <C-w>w<C-y><C-w>w

" Enable folding
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1

" PEP 8 standards
au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
autocmd FileType python set colorcolumn=80

" Full stack development indentation
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Flag useless whitespaces
au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" UTF-8 support
set encoding=utf-8

" YCM customization
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" python with virtualenv and conda env support
py3 << EOF
import os
import sys
import subprocess
if 'CONDA_PREFIX' in os.environ:
  project_base_dir = os.environ['CONDA_PREFIX']
  activate = os.path.join(project_base_dir, 'bin/activate')
  subprocess.call(activate)
elif 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  exec(activate_this, dict(__file__=activate_this))
EOF

" Syntax highlight in python
let python_highlight_all=1
syntax on

" LaTeX
let g:tex_flavor = 'latex'
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

" enable and set colorscheme
if exists('+termguicolors')
  set t_Co=256
endif
syntax enable
colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE "Transparent

" Line numbers
set nu

" Auto pep8 check when saving (run with F7 to avois syntastic incomp)
autocmd BufWritePost *.py call flake8#Flake8()

" NERDTree Options
let NERDTreeIgnore=['\.pyc$', '\~$']  " Ignore some files
autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
"let NERDTreeMinimalUI=1  " Hide help and bookmarks

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" If using powerline installed with vim
"py3 from powerline.vim import setup as powerline_setup
"py3 powerline_setup()
"py3 del powerline_setup
