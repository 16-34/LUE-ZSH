#----- 命令别名 -----#

# 安装：brew install eza
if command -v eza >/dev/null 2>&1 ; then
  alias ls="eza"
  alias ll="eza -lh --icons --git"
  alias la="eza -alh --icons --git"
  alias tree="eza --tree --icons"
fi

# 安装：brew install bat
if command -v bat >/dev/null 2>&1 ; then
  alias cat="bat"
fi

# 安装：brew install ripgrep
if command -v rg >/dev/null 2>&1 ; then
  alias grep='rg --color=auto' 
fi

alias diff='diff --color=auto' 
alias df='df -h'

# nvim
alias v="nvim"
alias vi="nvim"
alias vim="nvim"

alias cls="clear"
alias reload="source ~/.zshrc"
