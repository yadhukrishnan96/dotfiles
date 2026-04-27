export PATH="/usr/bin:$PATH"


# printf '\ec' 
    # in case terminal colors break due to auto theme 


##Podman couldt connect to systemd as d-bus was pointing to wrong path
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
# Point the D-Bus to the official Systemd User Bus
if [ -S "$XDG_RUNTIME_DIR/bus" ]; then
    export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus"
fi



## Podman command completeion 
if [[ -r /usr/share/bash-completion/bash_completion ]]; then
  . /usr/share/bash-completion/bash_completion
fi





# 1. PATH AND EDITOR
export PATH="/usr/local/go/bin:$HOME/.local/bin:$HOME/.fzf/bin:$PATH"
export EDITOR='nvim'
# Enable Emacs keybindings explicitly
bind -m emacs
# Bind Ctrl+K to kill-line manually if inputrc isn't working
bind '"\C-k":kill-line'

# 2. LOAD EXTERNAL ENVS

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"


echo 'export QTWEBENGINE_FORCE_USE_GBM=1' >> ~/.bashrc
echo 'export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"' >> ~/.bashrc










# 3. ALIASES

alias stl='sudo systemctl'
alias lsd='lsd -l'
alias ym='mpv " "'
alias n='nvim'
alias v='vim'
alias r='ranger'
alias d='docker'
alias p='podman'
alias book='bookokrat'
alias nf='nvim $(fzf)'
alias ls='ls --color=auto'
alias ll='ls -alF'
alias nb='nvim ~/.bashrc'
alias db='devbox'
alias nc='nvim ~/.config/niri/config.kdl'
alias sb='source ~/.bashrc'
alias gc='nvim ~/.config/ghostty/config'
alias gcp='f(){ git add -p && git commit -m "$1" && git push origin $(git branch --show-current); }; f'
alias wc='cd ~/dotfiles/scripts/ && ./wallpicker.sh'
alias gp='git add . && git commit -m "update" && git push'
alias pw='pywal'
alias kubectl='/usr/bin/kubectl'

complete -F _podman p

#set -o vi

# --- FZF (Arch paths) ---
[ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash
#[ -f /usr/share/fzf/completion.bash ] && source /usr/share/fzf/completion.bash

# --- Override Ctrl+T to open file in nvim ---
fzf-file-widget() {
  local file
  file=$(fzf)
  [[ -n "$file" ]] && nvim "$file"
}

bind -x '"\C-t": fzf-file-widget'

## STARSHP PROMPT
eval "$(starship init bash --print-full-init)"


#[ -f ~/.cache/wallust/sequences ] && cat ~/.cache/wallust/sequences
#[ -f ~/.cache/wallust/colors.sh ] && source ~/.cache/wallust/colors.sh



source "$HOME/.cache/wal/colors.sh"

hex_to_rgb() {
  printf "%d;%d;%d" 0x${1:1:2} 0x${1:3:2} 0x${1:5:2}
}

c1=$(hex_to_rgb "$color1")

PS1="\[$(tput setaf 7)\]\u@\h \[$(tput setaf 3)\]\w\n\[$(tput setaf 1)\]❯\[$(tput sgr0)\] "


pywal() {
    local img

    img=$(find "${1:-$HOME/wallpapers}" -type f \
        \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) \
        | fzf --preview 'chafa --size=${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES} {}' \
              --preview-window=right:60%)

    [[ -z "$img" ]] && return

    echo "[INFO] Selected: $img"

    # 🔹 Step 1: Generate colors
    if ! wal -i "$img" --backend colorz; then
        echo "[ERROR] wal failed"
        return
    fi

    # 🔹 Step 2: Apply wal colors to current terminal (optional but recommended)
    [ -f ~/.cache/wal/colors.sh ] && source ~/.cache/wal/colors.sh

    # 🔹 Step 3: Ensure awww daemon is running
    if ! pgrep -x awww-daemon >/dev/null; then
        echo "[INFO] Starting awww-daemon..."
        awww-daemon >/dev/null 2>&1 &
        sleep 0.5
    fi

    # 🔹 Step 4: Apply wallpaper with transition
    awww img "$img" \
        --transition-type center \
        --transition-step 10 \
        --transition-fps 60

    echo "[SUCCESS] Theme + wallpaper applied"
}





export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
export QTWEBENGINE_FORCE_USE_GBM=1
export QUTE_CHROMIUM_FLAGS="--use-angle=vulkan"
