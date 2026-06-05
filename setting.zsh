#----- 一些基础设置 -----#

## 按键绑定
bindkey -e

# Alt + 方向左：跳转到上一个词
bindkey '\e[1;3D' backward-word
# Alt + 方向右：跳转到下一个词
bindkey '\e[1;3C' forward-word

## Tab 补全
ZCOMPDUMP="$XDG_CACHE_HOME/zcompdump"

autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit -d "$ZCOMPDUMP"
else
  compinit -C -d "$ZCOMPDUMP"
fi

# 启用菜单式补全，并允许使用方向键选择候选项
zstyle ':completion:*' menu select
# 补全时忽略大小写
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# 使用 LS_COLORS 配置补全列表中的颜色显示
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# 去掉路径分隔符 /
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

## 历史记录
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$XDG_STATE_HOME/zsh_history"

setopt APPEND_HISTORY
# 多个终端会话之间共享命令历史
setopt SHARE_HISTORY
# 忽略前缀空格的命令
setopt HIST_IGNORE_SPACE
# 忽略相邻的重复命令
setopt HIST_IGNORE_DUPS
# # 删除旧的重复记录，只保留最新的一条
# setopt HIST_SAVE_NO_DUPS
# 搜索历史时跳过重复项
setopt HIST_FIND_NO_DUPS
# 历史文件写入时去重
setopt HIST_EXPIRE_DUPS_FIRST

# 正确的数字排序（例如 file10 在 file9 的后面，而不是在 file1 后面）
setopt NUMERIC_GLOB_SORT
