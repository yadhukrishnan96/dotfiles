# 1. PLUGINS (Combined into one clean list)
# Note: vi-mode is built-in to Oh My Zsh. 
# terraform, kubectl, and git add specialized completions.
plugins=(
  git 
  vi-mode 
  terraform 
  kubectl 
  docker
)

# 2. OH MY ZSH CORE
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="" # Using Starship below for the aesthetic

# 3. PATH AND EDITOR
# Ensure Homebrew is initialized BEFORE sourcing plugins
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export PATH="/usr/local/go/bin:$HOME/.local/bin:$HOME/.fzf/bin:$HOME/.cargo/bin:$PATH"
export EDITOR='nvim'

# 4. DIRECTORY & STARSHIP
if [[ "$PWD" == "/usr/share/applications" ]]; then
  cd "$HOME"
fi
eval "$(starship init zsh)"

# 5. LOAD OH MY ZSH (Must come before custom bindings)
source $ZSH/oh-my-zsh.sh

# 6. EXTERNAL PLUGINS (Sourced from Homebrew)
# Use Fast Syntax Highlighting ONLY (It is better than the standard one)
source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOMEBREW_PREFIX/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"

# 7. VI-MODE CUSTOMIZATIONS (The "jj" Power Move)
bindkey -M viins 'jj' vi-cmd-mode
export KEYTIMEOUT=10

# 8. DEVOPS & TERMINAL ALIASES
alias wf='cd ~/test-repo/.github/workflows'
alias n='nvim'
alias v='vim'
alias r='ranger'
alias d='docker'
alias k='kubectl'
alias tf='terraform'
alias adog="git log --all --decorate --oneline --graph"
alias tg='flatpak run org.telegram.desktop > /dev/null 2>&1 & disown'
alias save='git add . && git commit -m "updated notes" && git push'



# Common ls shortcuts
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# 9. TOOLS & ENVS
[ -s "$HOME/.nvm/nvm.sh" ] && \. "$HOME/.nvm/nvm.sh"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Enable Vi Mode in Zsh
bindkey -v

# Now the jj mapping will actually work
bindkey -M viins 'jj' vi-cmd-mode
export KEYTIMEOUT=20






