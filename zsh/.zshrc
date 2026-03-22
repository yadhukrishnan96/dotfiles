# 0. DIRECTORY FIX (The "Invisible Hand")
# If the terminal starts in the applications folder, jump to Home immediately.
if [[ "$PWD" == "/usr/share/applications" ]]; then
    cd "$HOME"
fi

# 1. OH MY ZSH CORE PATHS
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="" # Keep it clean for your neo-noir aesthetic

# 2. PATH AND EDITOR
export PATH="/usr/local/go/bin:$HOME/.local/bin:$HOME/.fzf/bin:$HOME/.cargo/bin:$PATH"
export EDITOR='nvim'

# 3. LOAD EXTERNAL ENVS
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# 4. DEVOPS & TERMINAL ALIASES
alias n='nvim'
alias v='vim'
alias r='ranger'
alias d='docker'
alias k='kubectl'            # Critical for K8s efficiency
alias tf='terraform'        # For your yadhu.com project
alias tg='flatpak run org.telegram.desktop > /dev/null 2>&1 & disown'

# Common ls shortcuts
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# 5. FZF & PLUGINS
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add 'terraform' and 'kubectl' plugins for better autocompletion
plugins=(git terraform kubectl docker)

# 6. PROMPT SETTINGS
# Your Mac-style Monochrome/Blue accents
PROMPT='%F{81}%n@%m%f %F{141}%~%f
 %B%F{75}➜%f '

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh
