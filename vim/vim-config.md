# Vim Configuration Guide

## Config File Location

| File | Purpose |
|------|---------|
| `~/.vimrc` | Vim configuration |
| `~/.config/ghostty/config` | Ghostty terminal configuration |

## Vim Config (~/.vimrc)

Current settings organized by section:

### Appearance
- `syntax on` — syntax highlighting
- `set number` — line numbers
- `set relativenumber` — relative line numbers
- `set ruler` — cursor position
- `set cursorline` — highlight current line
- `set showmatch` — highlight matching brackets
- `set list listchars=tab:»·,trail:·,nbsp:·` — show tabs as », trailing spaces as ·

### Indentation
- `set tabstop=2`, `shiftwidth=2`, `softtabstop=2` — 2-space indentation
- `set expandtab` — spaces not tabs
- `set autoindent`, `smartindent` — auto indent

### Search
- `set ignorecase`, `smartcase` — case-smart search
- `set hlsearch`, `incsearch` — highlight + incremental search
- `<leader>/` — clear search highlight

### Clipboard
- `set nocompatible` — use Vim defaults instead of Vi compatibility
- `set clipboard=unnamed` — sync with system clipboard (yy → Cmd+V anywhere)

### UI
- `set wildmenu` — command-line completion
- `set laststatus=2` — always show status line
- `set scrolloff=8` — keep 8 lines visible around cursor
- `set showcmd` — show partial commands in status line
- `set mouse=a` — enable mouse

Status line shows: `filename [modified?] [1/21] (line/total,column) percentage`

### Terminal & Performance
- `set termguicolors` — true color for Ghostty
- `set ttimeoutlen=10` — eliminate ESC delay
- `set lazyredraw` — faster macros
- `set synmaxcol=200` — skip syntax on super-long lines

### Cursor
- `set guicursor=n-v-c:block,i-ci-ve:ver25` — block cursor in normal/visual/command, vertical bar in insert mode

### Behavior
- `set hidden` — switch buffers without saving
- `set confirm` — ask instead of fail
- `set backspace=indent,eol,start` — sensible backspace
- `set history=1000`
- `set autoread` — auto-reload external changes

### Splits
- `set splitright`, `set splitbelow` — intuitive split direction

### File Type Detection
- `filetype plugin indent on`

### Completion
- `set completeopt=menuone,noselect`

### Wildmenu Exclusions
Ignores: `*.pyc`, `__pycache__/*`, `*.o`, `*.obj`, `*.class`, `node_modules/*`

### Persistence
- Backup → `~/.vim/backup//`
- Swap → `~/.vim/swap//`
- Undo → `~/.vim/undo//`
- `set undofile` — undo survives restart

## Key Mappings

Leader key is set to Space (`let mapleader = " "`).

| Shortcut | Action |
|----------|--------|
| `Space + /` | Clear search highlight |
| `Space + w` | Save file |
| `Space + q` | Quit window |
| `Space + bn` | Next buffer |
| `Space + bp` | Previous buffer |
| `Space + bd` | Delete buffer |
| `Space + ev` | Edit vimrc |
| `Space + sv` | Reload vimrc |
| `Space + e` | Toggle NERDTree file explorer |
| `Ctrl + h` | Move to split left |
| `Ctrl + j` | Move to split below |
| `Ctrl + k` | Move to split above |
| `Ctrl + l` | Move to split right |
| `jj` (insert mode) | Exit to normal mode |

### Auto Commands
- Strip trailing whitespace on every save

## Plugins

Plugins live in `~/.vim/pack/plugins/start/`. Vim 8+ auto-loads them.

### Installed
| Plugin | Purpose | Source |
|--------|---------|--------|
| **NERDTree** | File tree explorer with icons | `preservim/nerdtree` |
| **vim-devicons** | Nerd Font icons in file explorer | `ryanoasis/vim-devicons` |

### Install More
```bash
git clone <repo-url> ~/.vim/pack/plugins/start/<plugin-name>
```

### Plugin Recommendations
| Plugin | Purpose |
|--------|---------|
| `tpope/vim-fugitive` | Git integration |
| `tpope/vim-surround` | Surround text with quotes/brackets |
| `tpope/vim-commentary` | Toggle comments |
| `tpope/vim-unimpaired` | Bracket navigation maps |
| `junegunn/fzf.vim` | Fuzzy file search |

## NERDTree Specifics

- `Space + e` toggles NERDTree open/closed
- Hidden files are shown by default
- Press `?` in NERDTree for help
- Press `i` to open file in horizontal split, `s` for vertical split

## Ghostty Cursor Fix

The Ghostty config (`~/.config/ghostty/config`) has:
```
shell-integration-features = no-cursor
```
This prevents Ghostty's shell integration from overriding Vim's cursor settings.

## Quick Troubleshooting

| Problem | Fix |
|---------|-----|
| ESC feels slow | `set ttimeoutlen=10` (already set) |
| Big files lag | `set synmaxcol=200` (already set) |
| Icons show as boxes | Install Nerd Font and set in Ghostty config |
