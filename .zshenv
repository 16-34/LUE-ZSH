#----- 环境变量 -----#

# XDG 规范
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# npmrc
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
# less
export LESSHISTFILE="$XDG_STATE_HOME/less_history"

# PATH
path=(
    "$HOME/.local/bin"
    $path
)

# editor
export EDITOR=nvim
export VISUAL=nvim
