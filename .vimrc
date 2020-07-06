" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1

" Plugims
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Better python indentation
Plug 'vim-scripts/indentpython.vim'

" Autocompletion for python (compiled in conda base env)
Plug 'ycm-core/YouCompleteMe'

" Syntax and format checking
Plug 'dense-analysis/ale'
Plug 'nvie/vim-flake8'

" Color scheme
"Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'arcticicestudio/nord-vim'

" Initialize plugin system
call plug#end()

" Mapleader
let mapleader = "\<Space>"

" Disable auto comments
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" 4 spaces tab
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Python PEP 8 indentation
au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
autocmd FileType python set colorcolumn=80

" Flag useless whitespaces
au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" UTF-8 support
set encoding=utf-8

" Autocomplete customization
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Python highlight
let python_highlight_all=1
syntax on

" Set colorscheme
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
syntax enable
" set background=dark
" colorscheme solarized
"colorscheme base16-nord
colorscheme nord
hi Normal guibg=NONE ctermbg=NONE "Transparent

" Line numbers
set nu

" Auto pep8 check when saving (run with F7 to avois syntastic incomp)
autocmd BufWritePost *.py call flake8#Flake8()

" Open file where left off
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
