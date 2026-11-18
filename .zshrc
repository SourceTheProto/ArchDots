# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**'
zstyle ':completion:*' max-errors 3
zstyle ':completion:*' menu select=0
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/source/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

# Keybinds
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

# Startup
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval $(thefuck --alias)

# Aliases
alias ls="lsd"
alias ll="lsd -la"
alias tree="lsd --tree --depth 4"
alias grep="grep --color"
alias updates="echo Repos:;checkupdates;echo AUR:;paru -Qua"
alias paru="paru --bottomup"
alias fm="dolphin . > /dev/null 2>&1 & disown"

export PATH=$PATH:/home/source/.spicetify
export EDITOR=nvim
