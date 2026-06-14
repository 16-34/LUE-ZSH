#----- 一些基础设置 -----#

## 按键绑定
bindkey -e

# Alt + 方向左：跳转到上一个词
bindkey '\e[1;3D' backward-word
# Alt + 方向右：跳转到下一个词
bindkey '\e[1;3C' forward-word

# 在编辑器中编辑命令 
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line

# 撤销重做
bindkey '^xu' undo
bindkey '^xr' redo

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
