# LUE-ZSH

个人 Zsh 配置仓库。

## 目录结构

```text
.
├── plugins/       # 本地插件安装目录（已被 .gitignore 忽略）
├── .zshenv        # XDG 路径、npm/less 配置、PATH 等全局环境变量
├── .zshrc         # Zsh 主入口，按顺序加载各模块
├── homebrew.zsh   # Homebrew shellenv 初始化（兼容 macOS 与 Linuxbrew）
├── alias.zsh      # 常用命令别名
├── function.zsh   # 自定义函数
├── setting.zsh    # 按键、补全、历史记录等基础设置
├── plugin.zsh     # 插件安装、更新、加载逻辑
├── .gitignore     # 忽略本地私密配置、插件目录和缓存文件
└── README.md      # 项目说明
```

## 安装

推荐将仓库放到 `$HOME/.config/zsh`：

```bash
git clone --depth 1 https://github.com/16-34/LUE-ZSH ~/.config/zsh
```

然后在 `/etc/zshenv`（有时是`/etc/zsh/zshenv`）中配置 `ZDOTDIR`：

```bash
export ZDOTDIR="$HOME/.config/zsh"
```

重新打开终端

## 依赖安装

可通过 Homebrew 按需安装常用工具（以下为推荐工具）：

```bash
brew install starship zoxide fzf eza bat ripgrep neovim
```

首次使用可按需安装插件（以下为默认插件，也可以在 `~/.config/zsh/plugin.zsh` 中启用其他插件）：

```bash
zplugin_install marlonrichert/zsh-autocomplete
zplugin_install zsh-users/zsh-autosuggestions
zplugin_install zsh-users/zsh-syntax-highlighting
```

更新所有已安装插件：

```bash
zplugin_update
```

## 私密配置

如需保存不适合提交到 Git 的配置，可以创建：`~/.config/zsh/auth.zsh`

例如：

```bash
export SOME_TOKEN="xxx"
```
