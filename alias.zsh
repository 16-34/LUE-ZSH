#----- 命令别名 -----#

# 安装：brew install eza
if command -v eza >/dev/null 2>&1; then
    alias ls="eza"
    alias ll="eza -lh --icons --git"
    alias la="eza -alh --icons --git"
    alias tree="eza --tree --icons"
else
    alias ll="ls -l"
    alias la="ls -al"
fi

# 安装：brew install bat
if command -v bat >/dev/null 2>&1; then
    alias cat="bat"
fi

# 安装：brew install ripgrep
if command -v rg >/dev/null 2>&1; then
    alias grep='rg --color=auto'
fi

alias diff='diff --color=auto'
alias df='df -h'

# 安装：brew install nvim
if command -v nvim >/dev/null 2>&1; then
    export EDITOR=nvim
    export VISUAL=nvim

    alias v="nvim"
    alias vi="nvim"
    alias vim="nvim"
fi

alias cls="clear"
alias reload="source $LUE_ZSH_DIR/.zshrc"
