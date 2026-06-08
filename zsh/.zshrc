# Enable Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ---- Oh My Zsh ----
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

plugins=(git zsh-autosuggestions zsh-completions zsh-syntax-highlighting web-search)

source $ZSH/oh-my-zsh.sh
DISABLE_AUTO_UPDATE="true"

# ---- PATH ----
export PATH="/opt/homebrew/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PATH:/Users/hemanth/.lmstudio/bin"
export PATH="$PATH:/Users/hemanth/.local/bin"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.rustup/toolchains/stable-aarch64-apple-darwin/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/Users/hemanth/Desktop/Development/Projects/tview/target/debug:$PATH"

# ---- Language Runtimes ----
eval "$(pyenv init -)"

# ---- Prompt ----
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ---- Shell Enhancements ----
eval "$(fzf --zsh)"
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
eval "$(zoxide init zsh)"
auto-ls() { eza -A --icons=always --group-directories-first; }
chpwd() { auto-ls; }

# ---- Environment Variables ----
export BAT_THEME=OneHalfDark
export EDITOR=vim
export OLLAMA_FLASH_ATTENTION=true
[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

source ~/.zsh_secrets 2>/dev/null

# ---- Aliases ----
alias ..='cd ..'
alias ...='cd ../..'
alias cat=bat
alias docker=podman
alias act='source .venv/bin/activate'
alias dact='deactivate'
alias tccutil='/opt/homebrew/bin/tccutil'
alias vz="vim ~/.zshrc"
alias sz="source ~/.zshrc"
alias gtdev='cd /Users/hemanth/Desktop/Development/Projects'
alias oc=opencode
alias co='gh copilot'
alias reload='exec zsh'
alias cpwd='pwd | pbcopy'
alias finder='open .'
alias weather='curl wttr.in'
alias myip='curl -s ifconfig.me'

# ---- MLX Proxy ----
alias mlx-start="mlx-proxy start"
alias mlx-stop="mlx-proxy stop"
alias mlx-status="mlx-proxy status"
alias mlx-restart="mlx-proxy restart"

# ---- eza (better ls) ----
alias ls="eza -A --icons=always --group-directories-first"
alias ll="eza -lbAF --git --icons=always --group-directories-first"
alias lt="eza -A --tree --level=2 --icons=always --group-directories-first"
alias del="rmtree"

# ---- Utility Functions ----
dedup-history() {
  fc -W 2>/dev/null
  local tmp="${HISTFILE}.tmp"
  awk '!seen[substr($0, index($0, ";")+1)]++' <(tail -r "$HISTFILE") | tail -r > "$tmp" &&
  mv "$tmp" "$HISTFILE"
  wc -l < "$HISTFILE" | xargs printf "History deduped. %s unique entries remain.\n"
  fc -R 2>/dev/null
}

clear() {
  command clear
  command clear
}
