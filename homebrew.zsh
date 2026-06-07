# Homebrew
if [[ -x /opt/homebrew/bin/brew ]]; then
    # macos
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
    # linux
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
