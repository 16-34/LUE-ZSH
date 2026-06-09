LUE_ZSH_DIR="$HOME/.config/zsh"

source_if_readable() {
    local file="$1"

    if [[ -r "$file" ]]; then
        source "$file"
    fi
}

source_if_readable $LUE_ZSH_DIR/homebrew.zsh

# 启用菜单式补全，并允许使用方向键选择候选项
zstyle ':completion:*' menu select
# 补全时忽略大小写
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# 使用 LS_COLORS 配置补全列表中的颜色显示
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

## Tab 补全
ZCOMPDUMP="$XDG_CACHE_HOME/zcompdump"

autoload -Uz compinit
if [[ -n $ZCOMPDUMP(#qN.mh+24) ]]; then
    compinit -u -d "$ZCOMPDUMP"
else
    compinit -C -u -d "$ZCOMPDUMP"
fi

source_if_readable $LUE_ZSH_DIR/auth.zsh
source_if_readable $LUE_ZSH_DIR/function.zsh
source_if_readable $LUE_ZSH_DIR/alias.zsh
source_if_readable $LUE_ZSH_DIR/setting.zsh
source_if_readable $LUE_ZSH_DIR/plugin.zsh
