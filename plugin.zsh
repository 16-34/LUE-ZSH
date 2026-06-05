#----- 插件 -----#

zplugin_load() {
  local name="$1"
  local owner="$2"
  local dir="${ZSH_PLUGINS}/${name}"
  local entry=""

  [[ -z "$name" ]] && return 1

  if [[ ! -d "$dir" ]]; then
    if [[ -n "$owner" ]]; then
      echo "插件 '$name' 不存在，可使用 \`zplugin_install ${owner}/${name}\` 安装"
    else
      echo "插件 '$name' 不存在"
    fi
    return 1
  fi

  for f in "${name}.plugin.zsh" "${name}.zsh" "${name}.sh" "init.zsh"; do
    p="$dir/$f" 
    
    if [[ -r "$p" ]]; then
      entry="$p"
      break
    fi
  done

  if [[ -z "$entry" ]]; then
    echo "插件 '$name' 加载失败"
    return 1
  fi

  source "$entry"
  return 0
}

zplugin_install() {
  local repo="$1"
  local name="${repo:t}"
  local dir="${ZSH_PLUGINS}/${name}"

  [[ -z "$repo" ]] && return 1

  mkdir -p "$ZSH_PLUGINS"

  if [[ -d "$dir" ]]; then
    echo "插件已存在：$name"
    return 0
  fi

  git clone --depth=1 "https://github.com/${repo}.git" "$dir"
}

zplugin_update() {
  local dir

  for dir in "$ZSH_PLUGINS"/*; do
    [[ -d "$dir/.git" ]] || continue
    echo "更新：${dir:t}"
    git -C "$dir" pull --ff-only
  done
}

export ZSH_PLUGINS="$HOME/.config/zsh/plugins"

zplugin_load zsh-autosuggestions zsh-users
zplugin_load zsh-syntax-highlighting zsh-users
if zplugin_load zsh-history-substring-search zsh-users; then
  bindkey "^[[A" history-substring-search-up
  bindkey "^[[B" history-substring-search-down
  HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=black,bold,bg=green'
  HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=black,bold,bg=red'
fi

# 安装：brew install starship
if command -v starship >/dev/null 2>&1 ; then
  eval "$(starship init zsh)"
fi

# 安装：brew install zoxide
if command -v zoxide >/dev/null 2>&1 ; then
  eval "$(zoxide init zsh)"
  
  alias cd="z"
  alias cdi="zi"
fi

# 安装：brew install fzf
if command -v fzf >/dev/null 2>&1 ; then
  source <(fzf --zsh)
  export FZF_DEFAULT_OPTS="
    --height 40%
    --layout=reverse
    --border
  "

  zplugin_load fzf-tab Aloxaf
fi
