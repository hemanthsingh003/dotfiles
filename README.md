# dotfiles

Personal configuration files for development tools.

## Contents

| Directory | Tool | Config File |
|-----------|------|-------------|
| `vim/` | Vim | `.vimrc` |
| `ghostty/` | Ghostty | `config` |
| `zsh/` | Zsh | `.zshrc` |

## Usage

Clone and symlink the configs you need:

```bash
git clone https://github.com/hemanthsingh003/dotfiles.git ~/dotfiles
ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
ln -sf ~/dotfiles/ghostty/config ~/.config/ghostty/config
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
```

## Prerequisites

- **Nerd Font** — required for vim-devicons icons and Ghostty
- **Vim 8+** — for native package loading (`pack/plugins/start/`)
- **Zsh + Oh My Zsh** — required for zsh config
- **`~/.zsh_secrets`** — create manually for API keys (not tracked in repo)
