# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt autocd extendedglob nomatch
# bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
# zstyle :compinstall filename '/home/ost/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# plugins=(zsh-autocomplete)
plugins=(zsh-autosuggestion zsh-syntax-highlighting zsh-history-substring-search)

NEWLINE=$'\n'
PROMPT="%F{gray}[%*] %F{blue}%n@%m%f %F{cyan}%~%f${NEWLINE}%B>%b "




term="kitty"
EDITOR="helix"
VISUAL="helix"
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

XSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=white'

# Dotfiles
alias dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME/"

alias new="~/new.sh"
alias hx="helix"
alias e="helix"
alias hypr="sh /home/ost/starthypr.sh"
alias swy="sh /home/ost/startsway.sh"
alias make="make -j32"
alias split_h="~/scripts/split_h.sh"
alias py=python
alias lpoweroff="loginctl poweroff"
alias lreboot="loginctl reboot"
alias lct="~/git/lua_code_tool/lua_code_tool.lua"



GNUMAKEFLAGS="-j23"
MAKEFLAGS="-j23"


# Gurobi
export GUROBI_HOME="/home/ost/Downloads/gurobi1202/linux64"
export PATH="/home/ost/Downloads/gurobi1202/linux64/bin:$PATH"
export LD_LIBRARY_PATH="/home/ost/Downloads/gurobi1202/linux64/lib:$LD_LIBRARY_PATH"

# Emscripten
export PATH="/usr/lib/emscripten:$PATH"


# #dpcpp
# source /opt/intel/oneapi/setvars.sh

# Lua
export LUA_PATH="$HOME/git/lua_code_tool/?.lua;;"
