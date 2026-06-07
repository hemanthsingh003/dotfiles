" Vim configuration file

set nocompatible    " Use Vim defaults instead of Vi compatibility mode

let mapleader = " " " Set leader key to Space (for custom shortcuts)

" === Appearance ===
syntax on               " Enable syntax highlighting
set number              " Show line numbers
set relativenumber      " Show relative line numbers (easier for jumping)
set ruler               " Show cursor position (line, column) at bottom

" === Indentation ===
set tabstop=2           " Number of spaces a tab appears as
set shiftwidth=2        " Number of spaces for auto-indent (>>, <<)
set softtabstop=2       " Number of spaces for Tab key in insert mode
set expandtab           " Use spaces instead of tabs
set autoindent          " Copy indent from current line when starting new line
set smartindent         " Auto-indent based on code syntax (C-like languages)

" === Search ===
set ignorecase          " Case-insensitive search by default
set smartcase           " Override ignorecase if search has uppercase letters
set hlsearch            " Highlight all search results
set incsearch           " Show matches as you type

" === Clipboard ===
set clipboard=unnamed   " Use system clipboard for yank/put (yy, p, etc.)

" === UI ===
set wildmenu            " Show command-line completion menu
set showcmd             " Show partial commands in status line
set laststatus=2        " Always show status line
set scrolloff=8         " Keep 8 lines visible above/below cursor when scrolling
set mouse=a             " Enable mouse in all modes (click, scroll, resize)

" Status line: file | modified | search count (1/21) | line/col
function! StatuslineSearchCount()
  if !v:hlsearch | return '' | endif
  let c = searchcount()
  if empty(c) | return '' | endif
  return printf('[%d/%d] ', c.current, c.total)
endfunction
set statusline=%f\ %m\ %{&modifiable?'':'(ro)'}\ %=%{StatuslineSearchCount()}%-14.(%l/%L,%c%)\ %P

" === Behavior ===
set hidden              " Allow switching buffers without saving unsaved changes
set confirm             " Ask confirmation instead of failing on unsaved changes
set backspace=indent,eol,start  " Make backspace work across indents, line breaks, and insert start
set history=1000        " Remember 1000 command-line / search entries

" === Splits ===
set splitright          " New vertical splits open to the right
set splitbelow          " New horizontal splits open below

" === Completion ===
set completeopt=menuone,noselect  " Show menu even for single match, don't auto-select

" === Terminal & Performance ===
set termguicolors       " Enable true color support (for Ghostty)
set ttimeoutlen=10      " Reduce ESC delay for faster mode switching
set lazyredraw          " Don't redraw during macro execution (faster)
set synmaxcol=200       " Limit syntax highlighting to first 200 columns (performance)

" === File Type Detection ===
filetype plugin indent on   " Detect file types and apply their indentation rules

" === Visual Aids ===
set cursorline          " Highlight the current line
set showmatch           " Briefly highlight matching bracket when typing one
set list listchars=tab:»·,trail:·,nbsp:·  " Display tabs as » and trailing spaces as ·

" === File Watching ===
set autoread            " Auto-reload file when changed outside Vim

" === Wildmenu Exclusions ===
set wildignore+=*.pyc,__pycache__/*,*.o,*.obj,*.class,node_modules/*

" === Key Mappings ===
" <leader>/ clears search highlight
nnoremap <leader>/ :nohlsearch<CR>

" <leader>w saves current file
nnoremap <leader>w :w<CR>

" <leader>q quits current window
nnoremap <leader>q :q<CR>

" <leader>bn / <leader>bp cycles through buffers
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
" <leader>bd deletes current buffer
nnoremap <leader>bd :bdelete<CR>

" Ctrl+h/j/k/l moves between window splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" jk exits insert mode (avoids reaching for Esc)
inoremap jj <Esc>

" <leader>ev opens .vimrc for editing
nnoremap <leader>ev :e $MYVIMRC<CR>
" <leader>sv reloads .vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>

" Strip trailing whitespace on every save
autocmd BufWritePre * :%s/\s\+$//e

" <leader>e opens NERDTree file explorer
nnoremap <leader>e :NERDTreeToggle<CR>
" Show hidden files in NERDTree
let NERDTreeShowHidden = 1

" === Files & Persistence ===
set backupdir=~/.vim/backup//   " Store backup files here
set directory=~/.vim/swap//     " Store swap files here
set undodir=~/.vim/undo//       " Store persistent undo history here
set undofile                    " Persist undo history across Vim sessions


" === Cursor Shape ===
" Block in normal/visual/command, vertical bar in insert
set guicursor=n-v-c:block,i-ci-ve:ver25
