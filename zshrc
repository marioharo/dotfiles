## theme to use in oh-my-posh
eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/iterm2.omp.json)"

## path para los binarios
export PATH="$HOME/dotfiles/bin:$PATH"
# --binarios para gcloud--
export PATH=/usr/local/share/google-cloud-sdk/bin:"$PATH"
# --python compatible para gcloud (cambiar la ruta en versiones M1+)--
export CLOUDSDK_PYTHON="/usr/local/opt/python@3.13/bin/python3.13"

## ALIASES
alias zshconfig="nano ~/dotfiles/zshrc"
alias reload="source ~/.zshrc"
# para sincronizar dotfiles con la repo (push)
alias dotfiles-push='brew bundle dump --force --no-vscode && git add . && git commit -m "update: sync Brewfile and others" && git push origin main'

## -- de navegacion --
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

## --activar la memoria de las rutas --
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# Navegación sincronizada por rutas
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
alias 10='cd +10'
alias 11='cd +11'
alias 12='cd +12'

## -- de git --
alias gst='git status'
alias glg='git log'
#alias gaa='git add --all'
#alias gc='git commit'
#alias gcm='git commit -m'

## -- yt-dlp --
# Descargar video en mejor calidad pero limitando a 1080p (para no saturar tu Mac 2012)
alias ytd="yt-dlp -f 'bestvideo[ext=mp4][height<=1080]+bestaudio[ext=m4a]/best[ext=mp4]/best'"
# Descargar solo el audio en MP3
alias ytmp3="yt-dlp -x --audio-format mp3"


## PLUGINS PARA COMANDO AUTO SUGERIDO
# Instalar autosuggestions y zsh-syntax-highlighting
# -- cambia la ruta en mac M1+ /opt/homebrew/share/... --
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --- BÚSQUEDA INTELIGENTE EN EL HISTORIAL ---
# Cargar el módulo de selección de comandos
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Vincular las flechas arriba y abajo
bindkey '^[[A' up-line-or-beginning-search # Flecha arriba
bindkey '^[[B' down-line-or-beginning-search # Flecha abajo

# Si usas iTerm2 o Ghostty con ciertas configuraciones, a veces las flechas se mandan distinto:
bindkey "$terminfo[kcuu1]" up-line-or-beginning-search
bindkey "$terminfo[kcud1]" down-line-or-beginning-search

## --- SDKMAN! ---
# manejador de paquedes de java
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

## --- FNM (Fast Node Manager) ---
# Instalar fnm como manejador de paquetes de node
eval "$(fnm env --use-on-cd --shell zsh)"

## --- PYENV para python ---
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

## --- Fuzzy Finder (fzf) ---
# busqueda rapida pra la terminal de archivos e historial
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

source <(fzf --zsh)
