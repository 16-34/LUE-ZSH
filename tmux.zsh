#----- tmux 配置 -----#
if command -v tmux >/dev/null 2>&1; then
  ta() {
    local session
    if [[ -n "$1" ]]; then
      session="$1"
    else
      session="$(basename "$PWD")"
    fi

    # 将非法字符替换为下划线_
    session="${session//[^[:alnum:]_-]/_}"
    tmux new-session -A -s "$session"
  }

  alias tk="tmux kill-session -t"
  alias tl="tmux list-sessions"

  # ssh 连接自动进入 tmux
  if [[ -o interactive ]] \
      && [[ -z "$TMUX" ]] \
      && [[ -n "$SSH_CONNECTION" ]]
  then
    tmux new-session -A -s "-ssh"
  fi
fi
