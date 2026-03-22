# 1. PATH AND EDITOR
export PATH="/usr/local/go/bin:$HOME/.local/bin:$HOME/.fzf/bin:$PATH"
export EDITOR='nvim'

# 2. LOAD EXTERNAL ENVS
. "$HOME/.cargo/env"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# 3. ALIASES
alias n='nvim'
alias v='vim'
alias r='ranger'
alias d='docker'
alias book='bookokrat'
alias fd='fdfind'

# Common ls shortcuts
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'

# 4. FZF SETTINGS (Bash version)
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
