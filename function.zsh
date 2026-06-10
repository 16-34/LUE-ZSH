#----- 功能函数 -----#

# 代理管理
# 用法: proxy on | proxy off | proxy status
proxy() {
    local PROXY_URL="http://127.0.0.1:7890"
    
    case "$1" in
        on)
            export http_proxy="$PROXY_URL"
            export https_proxy="$PROXY_URL"
            export HTTP_PROXY="$PROXY_URL"
            export HTTPS_PROXY="$PROXY_URL"
            export all_proxy="$PROXY_URL"
            export ALL_PROXY="$PROXY_URL"
            echo "Proxy enabled: $PROXY_URL"
            ;;
        off)
            unset http_proxy
            unset https_proxy
            unset HTTP_PROXY
            unset HTTPS_PROXY
            unset all_proxy
            unset ALL_PROXY
            echo "Proxy disabled"
            ;;
        *)
            if [ -n "$http_proxy" ] || [ -n "$HTTP_PROXY" ]; then
                echo "Proxy is ON: ${http_proxy:-$HTTP_PROXY}."
                echo "Use \"proxy off\" if you want to turn it off."
            else
                echo "Proxy is OFF."
                echo "Use \"proxy on\" to turn it on."
            fi
            ;;
    esac
}

# 快速创建目录并进入
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# 启动 opencode 之前自动开启代理
opencode() {
    proxy on
    command opencode "$@"
}

# 创建 git 远程仓库
gremote() {
  if [ -z "$1" ]; then
    echo "用法: gremote <repo-name> <server> [port]"
    return 1
  fi

  local repo="$1"
  local server="$2"
  local port="${3:-22}"

  local remote_dir="~/${repo}.git"

  ssh -p "$port" "$server" "git init --bare $remote_dir"

  echo
  echo "裸仓库已创建:"
  echo "  ssh://$server:$port/$remote_dir"
  echo
  echo "添加远程仓库:"
  echo "  git remote add origin ssh://$server:$port/$remote_dir"
}

# 创建新项目
mkpj() {
    mkdir -p ~/Projects/"$1"
    cd ~/Projects/"$1"
    git init
}

# 进入项目
pj() {
    if [[ "$1" == "." ]]; then
        cd ~/Projects
        return
    fi

    local dir
    if [[ -n "$1" ]]; then
        dir=$(fd "$1" ~/Projects -td -d 1 | fzf)
    else
        dir=$(fd . ~/Projects -td -d 1 | fzf)
    fi

    [[ -n "$dir" ]] && cd "$dir"
}

# 编辑文件
vi() {
    # brew install fd-find
    local file
    file=$(fd "$1" | fzf)
    [[ -n $file ]] && $EDITOR "$file"
}
