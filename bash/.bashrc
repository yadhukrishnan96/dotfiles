# 1. PATH AND EDITOR
export PATH="/usr/local/go/bin:$HOME/.local/bin:$HOME/.fzf/bin:$PATH"
export EDITOR='nvim'

# 2. LOAD EXTERNAL ENVS

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# 3. ALIASES
alias n='nvim'
alias v='vim'
alias r='ranger'
alias d='docker'
alias book='bookokrat'
alias fd='fdfind'
alias ls='ls --color=auto'
alias ll='ls -alF'
alias nb='nvim ~/.bashrc'
alias db='devbox'
alias nc='nvim ~/.config/niri/config.kdl'
alias sb='source ~/.bashrc'

alias gcp='f(){ git add -p && git commit -m "$1" && git push origin $(git branch --show-current); }; f'

#set -o vi

# --- FZF (Arch paths) ---
[ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash
[ -f /usr/share/fzf/completion.bash ] && source /usr/share/fzf/completion.bash

# --- Override Ctrl+T to open file in nvim ---
fzf-file-widget() {
  local file
  file=$(fzf)
  [[ -n "$file" ]] && nvim "$file"
}

bind -x '"\C-t": fzf-file-widget'

## STARSHP PROMPT
eval "$(starship init bash --print-full-init)"

# Enable this for default working of bsle.sh
# source -- ~/.local/share/blesh/ble.sh

######################
# ble.sh integration
######################

# Replace with whatever "~/path/ble.sh/out/ble.sh" you are using
# if [ -f ~/ble.sh/out/ble.sh ]; then
#   source ~/ble.sh/out/ble.sh --noattach
#   ble-color-setface auto_complete fg=238,underline # Set autocomplete color to greyed out and underlined until activated
#   ble-face -s syntax_error fg=242                  # Set error or backspace to greyed out
#   bleopt complete_ambiguous=                       # Disable ambigous completion from generating
# fi

########################
# Setting prompt colors
########################

# get_color() { tput setaf "$1"; }

# Can be changed to whatever color number you want (0-15)
# COL_USER="${color4:-$(get_color 12)}" # Yellow-ish
# COL_HOST="${color6:-$(get_color 5)}"  # Blue-ish
# COL_PATH="${color2:-$(get_color 11)}" # Cyan/Green-ish
# COL_ROOT="${color1:-$(get_color 1)}"  # Red
# COL_RESET="$(tput sgr0)"

########################################
# Two-line dynamic prompt (root vs user)
########################################

# Disable ble.sh prompt override:
# bleopt prompt_ps1_final=
# bleopt prompt_ps1_transient=

# Customize to your liking
# if [ "$EUID" -eq 0 ]; then
#   PS1="┌──[\[${COL_ROOT}\]\u@${COL_HOST}\h\[${COL_RESET}\]]─[\[${COL_PATH}\]\w\[${COL_RESET}\]]\n└─\[${COL_PATH}\]# \[${COL_RESET}\]"
# else
#   PS1="┌──[\[${COL_USER}\]\u@${COL_HOST}\h\[${COL_RESET}\]]─[\[${COL_PATH}\]\w\[${COL_RESET}\]]\n└─\[${COL_PATH}\]\$ \[${COL_RESET}\]"
# fi

# Export the prompt
export PS1

##################
# History settings
##################

# export HISTCONTROL=ignoreboth
# export HISTSIZE=1000
# export HISTFILESIZE=2000
# shopt -s histappend
#
################
# Shell behavior
################

# shopt -s checkwinsize
# shopt -s nocaseglob

########################################
# Enable color support for core commands
########################################

# if [ -x /usr/bin/dircolors ]; then
#   test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#   export LS_COLORS="$LS_COLORS:ow=30;44:"
#   alias ls='ls --color=auto'
#   alias grep='grep --color=auto'
#   alias egrep='egrep --color=auto'
#   alias fgrep='fgrep --color=auto'
# fi

#################
# Bash completion
#################

# if ! shopt -oq posix; then
#   if [ -f /usr/share/bash-completion/bash_completion ]; then
#     . /usr/share/bash-completion/bash_completion
#   elif [ -f /etc/bash_completion ]; then
#     . /etc/bash_completion
#   fi
# fi

###############
# Attach ble.sh
###############

#[[ ! ${BLE_VERSION-} ]] || ble-attach

#########
# THE ENDZ=
