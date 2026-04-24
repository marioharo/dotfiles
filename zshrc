# --- 1. OPTIMIZACIÓN DE RUTA PARA HOMEBREW ---
# Evitamos llamar a 'brew --prefix' que es lentísimo (700ms aprox)
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# --- 2. THEME (Oh-My-Posh) ---
# Usamos la ruta directa para evitar el lag de brew --prefix
if [ -x "/usr/local/bin/oh-my-posh" ]; then
  eval "$(oh-my-posh init zsh --config /usr/local/opt/oh-my-posh/themes/iterm2.omp.json)"
fi

# --- 3. EXPORTS Y PATHS ---
export PATH="$HOME/dotfiles/bin:$PATH"
export PATH="/usr/local/share/google-cloud-sdk/bin:$PATH"
export CLOUDSDK_PYTHON="/usr/local/opt/python@3.13/bin/python3.13"
export PYENV_ROOT="$HOME/.pyenv"
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PYENV_ROOT/bin:$PATH"

# --- 4. ALIASES ---
alias zshconfig="nano ~/dotfiles/zshrc"
alias reload="source ~/.zshrc"
alias dotfiles-push='brew bundle dump --force --no-vscode && git add . && git commit -m "update: sync Brewfile and others" && git push origin main'
alias /='cd /'
alias ..='cd ..'
alias ...='cd ../..'
alias la='ls -a'
alias lah='ls -lah'
alias ll='ls -ll'
alias lad='lsd -a'
alias lld='lsd -ll'
alias tree='lsd --tree -F'
alias tree1='lsd --tree --depth 1 -F'
alias tree2='lsd --tree --depth 2 -F'
alias tree3='lsd --tree --depth 3 -F'
alias treemd='lsd --tree --icon never -F --group-dirs last'
alias md='mkdir -p'
alias count='ls -1 | wc -l'
alias count-a='ls -A1 | wc -l | tr -d " "'

# Navegación
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
alias d='dirs -v | head -10'
alias 1='cd +1'
alias 2='cd +2'
alias 3='cd +3'
alias 4='cd +4'
alias 5='cd +5'
alias 6='cd +6'
alias 7='cd +7'
alias 8='cd +8'
alias 9='cd +9'

# Git y utilidades
alias gst='git status'
alias glg='git log'
alias ytd="yt-dlp -f 'bestvideo[ext=mp4][height<=1080]+bestaudio[ext=m4a]/best[ext=mp4]/best'"
alias ytmp3="yt-dlp -x --audio-format mp3"

# --- 5. LAZY LOADING (La magia para la velocidad) ---

# SDKMAN! Lazy Load
export SDKMAN_DIR="$HOME/.sdkman"
sdk() {
    unset -f sdk
    [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
    sdk "$@"
}

# FNM Lazy Load
fnm() {
    unset -f fnm
    eval "$(fnm env --use-on-cd --shell zsh)"
    fnm "$@"
}

# Pyenv Lazy Load
pyenv() {
    unset -f pyenv
    eval "$(pyenv init -)"
    pyenv "$@"
}

# Angular completion Lazy Load
ng() {
    unset -f ng
    source <(command ng completion script)
    command ng "$@"
}

# --- 6. PLUGINS Y FZF (Al final) ---
# FZF (Carga directa es más rápida que el subshell)
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# Syntax highlighting SIEMPRE el último
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --- 7. HISTORIAL INTELIGENTE ---
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search 
bindkey '^[[B' down-line-or-beginning-search