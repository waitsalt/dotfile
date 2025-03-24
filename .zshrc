autoload -Uz compinit
compinit

## zsh 插件
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

## zsh 输入提示
export PROMPT='%F{50}%1~ >%f '

## 环境变量
export PATH=$PATH:$HOME/.npm/node_modules/.bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.npm/node_modules/.bin
export EDITOR=nvim

# 自定义命令
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias U='paru -Syu'
alias fast='fastfetch'
alias clear_pkg='sudo pacman -R $(pacman -Qdtq)'
alias git_config='git config user.name "waitsalt" && git config user.email "waitsalt@outlook.com"'

# 自定义函数
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

