# Download Znap, if it's not there yet.
[[ -r ~/.config/.zsh/znap/znap.zsh ]] ||
    git clone --depth 1 https://github.com/marlonrichert/zsh-snap.git ~/.config/.zsh/znap
source ~/.config/.zsh/znap/znap.zsh  # Start Znap

# `znap prompt` makes your prompt visible in just 15-40ms!
znap prompt sindresorhus/pure

# `znap source` starts plugins.
znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting

# # `znap function` lets you lazy-load features you don't always need.
# znap function _pyenv pyenv "znap eval pyenv 'pyenv init - --no-rehash'"
# compctl -K    _pyenv pyenv
#
# # `znap install` adds new commands and completions.
# znap install aureliojargas/clitest zsh-users/zsh-completions


## 编程环境
. /home/general/.env/.env

## 环境变量
export EDITOR=nvim
export PATH="${HOME}/.local/zed.app/bin:${PATH}"

# 自定义命令
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias U='paru -Syu'
alias fast='fastfetch'
alias clean='paru -Scc && sudo pacman -R $(pacman -Qdtq) && sudo journalctl --vacuum-size=10M'
alias venv_activate='source $PWD/.venv/bin/activate'

# 自定义函数
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# bun completions
[ -s "/home/general/.env/bun/_bun" ] && source "/home/general/.env/bun/_bun"
