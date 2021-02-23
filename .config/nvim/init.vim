" =============================================================================
"  Install plugins
" =============================================================================
let fzfpath=system('which fzf')
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')

  " Add plugins under this block
  call dein#begin('~/.cache/dein')
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " =========================================================================
  " Plugins here
  " =========================================================================
  " General
  call dein#add('tpope/vim-surround')           " Surround text with quotes or brackets
  call dein#add('tpope/vim-commentary')         " Commenting out stuff
  call dein#add('tpope/vim-repeat')             " Repeat stuff from plugins with '.'
  call dein#add('tpope/vim-fugitive')           " Git
  call dein#add('easymotion/vim-easymotion')    " Enhanced motions
  call dein#add('kana/vim-textobj-user')        " Custom text objects vim
  call dein#add('kana/vim-textobj-entire')      " Entire buffer object with ae/ie
  call dein#add('sjl/gundo.vim')                " Show and navigate undo tree
  call dein#add('christoomey/vim-tmux-navigator')  " Easily navigate tmux and vim

  " File navigation
  call dein#add('scrooloose/nerdtree')
  call dein#add('liuchengxu/vista.vim')
  " call dein#add('majutsushi/tagbar')

  " Fuzzy-find with fzf
  call dein#add(fzfpath)
  call dein#add('junegunn/fzf.vim')

  " Auto close/match
  call dein#add('jiangmiao/auto-pairs')  " Pairs
  call dein#add('adelarsq/vim-matchit')  " Extended % matching
  call dein#add('alvan/vim-closetag')    " Auto-close tags

  " Autcomplete and linting
  " OPTION 1: Basic vim setup
  " call dein#add('dense-analysis/ale')  " Linting with ALE
  " call dein#add('Shougo/deoplete.nvim')  " Autocomplete
  " call dein#add('deoplete-plugins/deoplete-jedi') " use jedi for completion
  " OPTION 2: Vscode like intellisense and language server
  " call dein#add('neoclide/coc.nvim', {'branch': 'release'})
  " OPTION 3: built-in neovim lsp support
  call dein#add('neovim/nvim-lspconfig')  " Easier config for built-in lsp
  call dein#add('Shougo/deoplete.nvim')  " Autocomplete
  call dein#add('Shougo/echodoc.vim')  " Autocomplete
  call dein#add('deoplete-plugins/deoplete-lsp') " use lsp with deoplete
  call dein#add('sbdchd/neoformat')

  " Prose
  call dein#add('lervag/vimtex')
  call dein#add('reedes/vim-pencil')
  call dein#add('reedes/vim-textobj-sentence')
  call dein#add('junegunn/goyo.vim')

  " Style
  call dein#add('Glench/Vim-Jinja2-Syntax')
  call dein#add('morhetz/gruvbox')
  call dein#add('altercation/vim-colors-solarized')  " NOTE: needed for togglebg function
  call dein#add('vim-airline/vim-airline')  " Airline status bar
  call dein#add('ryanoasis/vim-devicons')

  " Python development
  call dein#add('hynek/vim-python-pep8-indent')         " Better python indentation
  call dein#add('jeetsukumaran/vim-pythonsense')  " text objects and motions (]m, ]c, af/c)
  call dein#add('jpalardy/vim-slime', { 'on_ft': 'python' })
  call dein#add('hanschen/vim-ipython-cell', { 'on_ft': 'python' })
  call dein#add('goerz/jupytext.vim')


  call dein#add('SirVer/ultisnips')
  call dein#add('honza/vim-snippets')
  call dein#add('heavenshell/vim-pydocstring', { 'do': 'make install' })

  " Add plugins above this block
  call dein#end()
  call dein#save_state()

endif

" ============================================================================
" Basic Config
" ============================================================================
filetype plugin indent on  " Indentation
set encoding=utf8          " UTF-8 support
set mouse=a                " Enable mouse
set list                   " Show empty lines
set path+=**               " Add all recursive tree to path for find command
set title                  " Make alt-tab easier

" Settings for better coc-nvim
set nobackup        " Always
set nowritebackup
set updatetime=300
set shortmess+=c

" Color column 88 (using black formatting python)
if exists("&colorcolumn")
    set colorcolumn=89
endif

" Folding
set foldmethod=expr
  \ foldexpr=lsp#ui#vim#folding#foldexpr()
  \ foldtext=lsp#ui#vim#folding#foldtext()
set foldlevel=99

" Default indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent  " Auto indent after a {


" Search file
set ignorecase             " Ignore case in searces and subs
set smartcase              " When upper case in search, don't ignore
nnoremap <buffer><CR> :nohlsearch<CR>

" Line numbers
set number                 " Line numbers
set numberwidth=3	   " Put numbers out of the way

" Remove trailing spaces at EOLs
autocmd BufWritePre * :%s/\s\+$//e

" Disable automatic comment continuation
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Restart with cursor where it left
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
set viminfo^=%  " Remember buffer info

" Command mode completion
set wildmode=longest:full                                   " Complete only common part in wildmenu
set wildignore+=.git,.svn                                   " VCS
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.pdf,*.mp3  " Output/media files
set wildignore+=*.pyc,*.o,*.so,*.out                        " Compiled files
set wildignore+=*.fits,*.hdf5                               " Data files

" ===========================================================================
" General mappings
" ============================================================================
" Navigate windows
" Comment out if use vim-tmux
" nnoremap <A-j> <C-w>j
" nnoremap <A-k> <C-w>k
" nnoremap <A-l> <C-w>l
" nnoremap <A-h> <C-w>h

" Use A instead of C
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
nnoremap <silent> <M-\> :TmuxNavigatePrevious<cr>

" Resize windows
" nnoremap <C-j> <C-w>+
" nnoremap <C-k> <C-w>-
" nnoremap <C-l> <C-w>>
" nnoremap <C-h> <C-w><

" Navigate and move tabs
map <leader>tn :tabnew<CR>
map <leader>to :tabonly<CR>
map <leader>tc :tabclose<CR>
map <leader>tm :tabmove<CR>
map <leader>]  :tabnext<CR>
map <leader>[  :tabprev<CR>

" Yank consistent with C and D
nnoremap Y y$

" Delete next in insert mode
inoremap <C-d> <Del>

" Alternative escape from insert mode
" inoremap jk <ESC>

" Additional save and exit options
command! W :w
command! Q :q
nnoremap <leader>. :w<cr>

" Move line in up or down file
nnoremap - ddkkp
nnoremap + ddp

" Switch 0 and ^ (we can use _ instead of ^ to avoid a recursive mapping)
" From https://github.com/jvinet/dotfiles/blob/master/vimrc
map 0 _
map ^ 999h
map <leader>0 ^

" Configure and source vimrc
nnoremap <leader>cv :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Alternative way to navigate completion menu with tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Toggle some display options
noremap <leader>n :set number!<CR>
noremap <leader>l :set list!<CR>

" Toggle paste mode
map <leader>p :setlocal paste!<CR>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Write prose
map <A-f> :setlocal spell! spelllang=fr<CR>
map <A-e> :setlocal spell! spelllang=en_ca<CR>
noremap <leader>w vasgq
noremap <leader>W vipJ
function Prose ()
  set formatoptions+=t
  set linebreak
  set wrap
  set nolist
  set display=lastline
  set noautoindent
  set nocindent
  set nosmartindent
  set indentexpr=
  set colorcolumn=
  nnoremap j gj
  nnoremap k gk
  vnoremap j gj
  vnoremap k gk
endfunction

" ============================================================================
" Color scheme
" ============================================================================
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1  " Use powerline fonts
syntax on
set termguicolors
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'
colorscheme gruvbox
call togglebg#map("<F5>")  " Toggle dark/light

" ============================================================================
" Per filetype config
" ============================================================================
" Python (PEP 8)
au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" LaTeX
au FileType tex map <Leader><CR> :VimtexCompile<CR>
autocmd FileType tex,plaintex call Prose()

" Prose in text and md
autocmd BufNewFile,BufRead *.txt call Prose()
autocmd BufNewFile,BufRead *.md call Prose()

" ============================================================================
" Plugins
" ============================================================================
" fzf
nmap <leader>zb :Buffers<CR>  " Similar to :b but with previews
nmap <leader>zf :Files<CR>    " Files
nmap <leader>zr :Tags<CR>     " Tags in project (ctags -R)
nmap <leader>zt :BTags<CR>    " Tags in buffer

" gundo
let g:gundo_prefer_python3 = 1
nmap <leader>u :GundoToggle<CR>

" NERDTree (withautoclose)
nmap <leader>e :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFocus<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Vista tagbar/structure bar
" let g:vista_default_executive = 'coc'
nmap <leader>b :Vista!!<CR>
" nmap <leader>vc :Vista ctags<CR>

" Formatting
" let g:neoformat_enabled_python = ['black', 'isort']
" let g:neoformat_run_all_formatters = 1
" nmap <space>f :Neoformat<CR>

" Autcomplete
let g:python3_host_prog=system("which python | tr -d '\n'")  " Handle conda envs
let g:deoplete#enable_at_startup = 1
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = "floating"
" let g:deoplete#lsp#handler_enabled = 1
lua << EOF

-- require'lspconfig'.pyright.setup{}

local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd!
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

local autoformat = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  -- Set some keybinds conditional on server capabilities
  local opts = { noremap=true, silent=true }
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
end

-- Add servers without specific config here
-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup {
--     on_attach = on_attach;
--   }
-- end

-- For python use pyright for navigation and typecheck, diagnosticls for PEP8
nvim_lsp.pyright.setup {
  on_attach = on_attach;
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off";
      }
    }
  }
}
nvim_lsp.diagnosticls.setup {
  on_attach = autoformat;
  filetypes = { "python" };
  init_options = {
    filetypes = {
      python = {"flake8"};
    };
    linters = {
      flake8 = {
        debounce = 100,
        sourceName = "flake8",
        command = "flake8",
        args = {
          "--format",
          "%(row)d:%(col)d:%(code)s:%(code)s: %(text)s",
          "%file",
        },
        formatPattern = {
          "^(\\d+):(\\d+):(\\w+):(\\w).+: (.*)$",
          {
              line = 1,
              column = 2,
              message = {"[", 3, "] ", 5},
              security = 4
          }
        },
        securities = {
          E = "error",
          W = "warning",
          F = "info",
          B = "hint",
        },
      },
    };
    formatFiletypes = {
      python = {"black", "isort"}
    };
    formatters = {
      black = {
        command = "black",
        args = { "--quiet", "-" }
      },
      -- yapf = {
      --   command = "yapf",
      --   args = { "--quiet",}
      -- },
      isort = {
        command = "isort",
        args = { "--quiet", "-" }
      }
    };
  }
}
EOF

" call deoplete#custom#var('omni', 'input_patterns', {
"       \ 'tex': g:vimtex#re#deoplete
"       \})
let g:vimtex_complete_recursive_bib = 1

" " Snippets
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:ultisnips_python_style = 'spinx'

" Python docstrings
nmap <silent> <c-i> <Plug>(pydocstring)
let g:pydocstring_formatter = 'sphinx'
let g:pydocstring_templates_path="~/.local/share/doqtemplates"
let g:pydocstring_doq_path="~/.local/bin/doq"

" Python cells
let g:slime_target = "tmux"
let g:slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{top-right}' }
let g:slime_dont_ask_default = 1
nnoremap <Leader>ii :IPythonCellExecuteCell<CR>
nnoremap <Leader>iI :IPythonCellExecuteCellJump<CR>
nnoremap <Leader>il :IPythonCellClear<CR>
nnoremap <Leader>ir :IPythonCellRun<CR>
nnoremap [c :IPythonCellPrevCell<CR>
nnoremap ]c :IPythonCellNextCell<CR>

" Jupyter notebooks
let g:jupytext_fmt = 'py:percent'
