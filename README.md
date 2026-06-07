# dotfiles

Personal configuration files for development tools.

## Contents

| Directory | Tool | Config File |
|-----------|------|-------------|
| `vim/` | Vim | `.vimrc` |
| *(more coming)* | | |

## Usage

Clone and symlink the configs you need:

```bash
git clone https://github.com/hemanthsingh003/dotfiles.git ~/dotfiles
ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
```

## Prerequisites

- **Nerd Font** — required for vim-devicons icons
- **Vim 8+** — for native package loading (`pack/plugins/start/`)
