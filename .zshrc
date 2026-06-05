source_if_readable() {
  local file="$1"

  if [[ -r "$file" ]]; then
    source "$file"
  fi
}

source_if_readable $ZDOTDIR/auth.zsh
source_if_readable $ZDOTDIR/function.zsh
source_if_readable $ZDOTDIR/alias.zsh
source_if_readable $ZDOTDIR/setting.zsh
source_if_readable $ZDOTDIR/plugin.zsh
