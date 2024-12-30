" ==========================
" Basic Settings
" ==========================

" Enable syntax highlighting
syntax on
filetype plugin indent on

" Use spaces instead of tabs
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Show line numbers
set number
set relativenumber

" Enable mouse support
set mouse=a

" Enable clipboard support
set clipboard=unnamedplus

" Highlight current line
set cursorline

" Enable incremental search
set incsearch
set ignorecase
set smartcase

" Enable line wrapping
set wrap

" Enable persistent undo
set undofile
set undodir=~/.vim/undo

" Set colorscheme (optional, choose your preference)
colorscheme desert

" ==========================
" Plugin Management
" ==========================

call plug#begin('~/.vim/plugged')

" File Explorer
Plug 'preservim/nerdtree'

" Vimwiki for personal wiki
Plug 'vimwiki/vimwiki'

" Vim-commentary for easy commenting
Plug 'tpope/vim-commentary'

" Code completion using coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntax highlighting and more
Plug 'sheerun/vim-polyglot'

" Status line (optional for better UI)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" ==========================
" Plugin Configurations
" ==========================

" --------------------------
" NERDTree Configuration
" --------------------------
" Toggle NERDTree with Ctrl+n
nnoremap <C-n> :NERDTreeToggle<CR>

" Automatically close Vim if NERDTree is the only window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | quit | endif

" --------------------------
" Vimwiki Configuration
" --------------------------
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
" Use markdown syntax and file extension

" --------------------------
" vim-commentary Configuration
" --------------------------
" No additional configuration needed; use `gc` mappings

" --------------------------
" coc.nvim Configuration
" --------------------------
" Use <Tab> and <S-Tab> to navigate completion menu
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use K to show documentation in preview window
nnoremap <silent> K :call CocAction('doHover')<CR>

" Enable code actions via <leader>ca
nmap <leader>ca <Plug>(coc-codeaction)

" --------------------------
" vim-polyglot Configuration
" --------------------------
" vim-polyglot enables improved syntax highlighting and language support

" --------------------------
" vim-airline Configuration
" --------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='dark'

" ==========================
" Language-Specific Settings
" ==========================

" --------------------------
" Python Settings
" --------------------------
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
" You can add more Python-specific settings here

" --------------------------
" Bash Settings
" --------------------------
autocmd FileType sh setlocal expandtab shiftwidth=4 softtabstop=4
" You can add more Bash-specific settings here

" --------------------------
" Lua Settings
" --------------------------
autocmd FileType lua setlocal expandtab shiftwidth=4 softtabstop=4
" You can add more Lua-specific settings here

" ==========================
" Keybindings
" ==========================

" Leader key
let mapleader = " "

" Save the current file with <leader>w (e.g., Space + w)
nnoremap <leader>w :w<CR>
inoremap <leader>w <Esc>:w<CR>a

" Quit Vim with <leader>q
nnoremap <leader>q :q<CR>
inoremap <leader>q <Esc>:q<CR>

" Split windows
" Horizontal split
nnoremap <leader>sh :split<CR>
" Vertical split
nnoremap <leader>sv :vsplit<CR>

" Navigate between splits using Ctrl + {h,j,k,l}
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Yank and paste to/from system clipboard
" Yank current line to clipboard with <leader>y
nnoremap <leader>y "+yy
" Yank selection to clipboard in visual mode with <leader>y
vnoremap <leader>y "+y
" Paste from clipboard with <leader>p
nnoremap <leader>p "+p
vnoremap <leader>p "+p

" Toggle spell checking with <leader>s
nnoremap <leader>s :set spell!<CR>

" ==========================
" coc.nvim Extensions
" ==========================

" Use coc.nvim extensions for Python, Bash, and Lua
" Install these extensions via :CocInstall command
" Example:
" :CocInstall coc-pyright coc-sh coc-sumneko-lua

" You can add the following to automatically install extensions if not present
" Uncomment below if desired

" if empty(glob('~/.vim/plugged/coc.nvim'))
"     Plug 'neoclide/coc.nvim', {'branch': 'release'}
"     call plug#end()
"     " Install extensions
"     autocmd VimEnter * :CocInstall coc-pyright coc-sh coc-sumneko-lua
" endif

" ==========================
" Additional Settings
" ==========================

" Enable autoformat on save using coc.nvim
autocmd BufWritePre *.py,*.sh,*.lua :call CocAction('format')

" Show line diagnostics automatically in hover window
autocmd CursorHold * silent call CocActionAsync('highlight')

" ==========================
" End of .vimrc
" ==========================
