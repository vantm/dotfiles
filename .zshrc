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
bindkey "^F" autosuggest-accept

# plugins
eval "$(zoxide init zsh)"
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
alias ysy='yay -Syu '
alias yss='yay -Ss '
alias zso='source ~/.zshrc'

# Functions

function vzz() {
    local P=$(fzf)

    if [[ -n $P ]] ; then
        nvim $P
    fi
}

function zz() {
    local P=$(fd --type dir | fzf)

    if [[ -n $P ]] ; then
        z $P
    fi
}

# GO paths
export GOPATH="$HOME/.local/share/go"

# .NET paths
export DOTNET_ROOT="$HOME/.local/share/dotnet"

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

# docker
export PATH=$HOME/bin:$PATH
export DOCKER_HOST=unix:///run/user/$(id -u)/docker.sock

[ -f "/home/vantm/.ghcup/env" ] && . "/home/vantm/.ghcup/env" # ghcup-env