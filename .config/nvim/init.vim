" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Autocompletion
  call dein#add('Shougo/deoplete.nvim')  " general
  call dein#add('zchee/deoplete-jedi')   " python
  call dein#add('davidhalter/jedi-vim')   " python
  call dein#add('alvan/vim-closetag')

  " Python Style
  call dein#add('dense-analysis/ale')	    " Syntax
  call dein#add('nvie/vim-flake8')		    " formatting

  " LaTeX
  call dein#add('lervag/vimtex')

  " Better Folding
  call dein#add('tmhedberg/SimpylFold')

  " Better Folding
  " For neovim
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')

  " Nice status bar
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('scrooloose/nerdtree')
  call dein#add('ryanoasis/vim-devicons')

  " Color scheme
  call dein#add('dracula/vim', { 'name': 'dracula' })

  " Match plugins
  call dein#add('jiangmiao/auto-pairs')

  " Snippets
  call dein#add('SirVer/ultisnips')
  call dein#add('honza/vim-snippets')

  " tpope plugins
  call dein#add('tpope/vim-surround')   " Surround text with quotes or brackets
  call dein#add('tpope/vim-fugitive')   " Git
  call dein#add('tpope/vim-commentary') " Commenting out stuff
  call dein#add('tpope/vim-repeat')     " Repeat stuff from plugins with .

  call dein#end()
  call dein#save_state()

endif

" include everything recursively for file searches
" (can be slow in large projects but generally helpful)
set path+=**

" Default split locations (more intuitive)
set splitbelow

" Python autocomplete
let g:python3_host_prog=system("which python | tr -d '\n'")  " Handle conda envs
let g:deoplete#enable_at_startup = 1
let g:jedi#completions_enabled = 0
let g:jedi#use_splits_not_buffers = "right"

filetype plugin indent on
syntax enable

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

" Flag useless whitespaces
au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Auto pep8 check when saving (run with F7 to avois syntastic incomp)
autocmd BufWritePost *.py call flake8#Flake8()

" UTF-8 support
set encoding=utf-8

" Theming and window style
if exists('+termguicolors')
  set t_Co=256
endif
colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE "Transparent
let g:airline_powerline_fonts = 1

" Line numbers
set nu

" vim script
au FileType vim setlocal
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2
    \ expandtab

" Shell scripts
au FileType sh,zsh setlocal 
  \ tabstop=2
  \ softtabstop=2
  \ shiftwidth=2
  \ expandtab
  \ autoindent

" Full stack development
au FileType js,html,css setlocal
  \ tabstop=2
  \ softtabstop=2
  \ shiftwidth=2
  \ expandtab
  \ autoindent

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

" LaTeX
let g:tex_flavor = 'latex'
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif

" LaTeX Autocomplete
call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})
g:vimtex_complete_recursive_bib = 1

let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" NERDTree Options
let NERDTreeIgnore=['\.pyc$', '\~$']  " Ignore some files
"autocmd vimenter * NERDTree
autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror
autocmd VimEnter * wincmd w
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

" mouse support
set mouse=a

" Easily scroll next window
nnoremap <A-j> <C-w>p<C-e><C-w>p
nnoremap <A-k> <C-w>p<C-y><C-w>p

" Disable automatic comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
