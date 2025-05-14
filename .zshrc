fpath+=($HOME/.config/pure)

autoload -Uz promptinit; promptinit
prompt pure

setopt histignorealldups sharehistory

unsetopt BEEP

# Use vim keybindings
bindkey -v

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Make Ctrl-Left Ctrl-Right jump between words
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey -M viins "^F" autosuggest-accept

# plugins
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"
source ~/.config/fzf-tab/fzf-tab.plugin.zsh
source ~/.config/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ~/.config/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Aliases
alias ll="ls -la"
alias la="ls -1a"
alias rm="rm -i"
alias mv="mv -i"
alias k=kubectl
alias v=nvim
alias vi=nvim
alias lg=lazygit

alias zso='source ~/.zshrc'

alias rebar='setopt NO_HUP && pkill waybar && waybar &'

function sesh-sessions() {
  exec </dev/tty
  exec <&1
  local sessions="$(sesh list -t)\n~\n$(sesh list -zc | sort -g)"
  local session=$(echo $sessions | fzf --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')
  zle reset-prompt > /dev/null 2>&1 || true
  [[ -z "$session" ]] && return
  sesh connect $session
}

zle     -N             sesh-sessions
bindkey -M vicmd '\et' sesh-sessions
bindkey -M viins '\et' sesh-sessions

function repl-py {
  FILE=$1
  python $FILE
  echo "Waching $FILE ..."
  while inotifywait -qq -e modify -e move_self $FILE;
  do
    sleep 0.5
    python $FILE
  done
}

function edit-file {
  # user fzf to find files, and use vim to edit them
  # if user quits fzf, exit
  local file=$(\
    fd -H -t f -d=10 \
      -E .vs -E .vscode -E .idea \
      -E .dotnet -E bin -E obj -E '*.dll' \
      -E __pycache__ -E .env -E .ipython \
      -E .cargo -E target \
      -E .cabal -E .ghcup \
      -E .sdkman -E jdtls -E .java -E .gradle -E '*.jar' \
      -E node_modules -E .nvm \
      -E .docker \
      -E .git -E .cache -E .pki -E .steam -E .cmake \
      -E '*.log' -E '*.tmp' -E '*.bak' \
      -E '*.db' \
      -E '*.bin' \
      -E '*.iso' \
      -E '*.mp*' \
      -E '*.jpg' \
      -E '*.jpeg' \
      -E '*.png' \
      -E '*.gif' \
      -E '*.gz' \
      -E '*.xz' \
      -E '*.tar' \
      -E '*.zip' \
      | fzf --height 40% --reverse --border-label ' edit ' --border --prompt '⚡')
  [[ -z "$file" ]] && return
  nvim "$file"
}

zle     -N             edit-file
bindkey -M vicmd '\ee' edit-file
bindkey -M viins '\ee' edit-file

# GO paths
export GOPATH="$HOME/.local/share/go"

# .NET paths
export DOTNET_ROOT="$HOME/.local/share/dotnet"
export DOTNET_HOST_PATH="$DOTNET_ROOT/dotnet"
export PATH="$PATH:$HOME/.dotnet/tools"

# OmniSharp path
export OMNISHARP_ROOT="$HOME/.local/share/omnisharp"

# paths
export PATH="$PATH:$HOME/.local/bin:$GOPATH/bin:$DOTNET_ROOT:$DOTNET_ROOT/tools:$OMNISHARP_ROOT"

# nvm paths
source /usr/share/nvm/init-nvm.sh

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# java
local jdtls_dir="$HOME/.local/share/nvim/mason/packages/jdtls"
export JDTLS_JVM_ARGS="-javaagent:${jdtls_dir}/lombok.jar"

# docker
export PATH=$HOME/bin:$PATH
export DOCKER_HOST=unix:///run/user/$(id -u)/docker.sock

[ -f "/home/vantm/.ghcup/env" ] && . "/home/vantm/.ghcup/env" # ghcup-env

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

[[ "$XDG_SESSION_TYPE" == "tty" ]] && /usr/bin/Hyprland
