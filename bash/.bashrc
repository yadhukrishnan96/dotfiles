export PATH=/usr/local/go/bin:$PATH




alias book='bookokrat'




# ~/.bashrc — customized for better completion & usability

# Exit early if not running interactively
case $- in
    *i*) ;; 
      *) return;;
esac

# -----------------------------
# History settings
# -----------------------------
HISTCONTROL=ignoreboth        # no duplicates or leading space commands
shopt -s histappend           # append to history, don’t overwrite
HISTSIZE=5000
HISTFILESIZE=10000
# Timestamp each history entry
HISTTIMEFORMAT="%F %T "

# -----------------------------
# Terminal behavior
# -----------------------------
shopt -s checkwinsize         # auto-update window size
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"  # better less support

# -----------------------------
# Fancy prompt with colorsON
# -----------------------------
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# Show working dir + host in terminal title (xterm/rxvt)
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
esac

# -----------------------------
# Aliases
# -----------------------------
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Common ls shortcuts
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Notify when long command finishes
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history | tail -n1 | sed -e "s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//")"'

# Load extra aliases if available
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# -----------------------------
# Bash completion (main part)
# -----------------------------
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# -----------------------------
# Path setup
# -----------------------------
export PATH="$HOME/.local/bin:$PATH"

# -----------------------------
# Optional: History search & autosuggestions (add later if desired)
# -----------------------------
# If you install bash-preexec and bash-autosuggestions:
# git clone https://github.com/rcaloras/bash-preexec.git ~/.bash-preexec
# git clone https://github.com/marlonrichert/bash-autosuggestions ~/.bash-autosuggestions
# Then uncomment below:
# source ~/.bash-preexec/bash-preexec.sh
# source ~/.bash-autosuggestions/bash-autosuggestions.sh

# -----------------------------
# End of file
# -----------------------------

alias d="docker"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export EDITOR=vim
cd ~
. "$HOME/.cargo/env"
