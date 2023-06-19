# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc


export SSH_AUTH_SOCK=/run/user/1000/keyring/ssh
export FZF_DEFAULT_OPTS='-i --height=~15%'
export PS1="\[\e[32m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\]\[\e[32m\]]\[\e[m\]\[\e[32;47m\]\\$\[\e[m\] "
source /usr/share/fzf/shell/key-bindings.bash


bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

function tmux-select ()
{
	tmux attach-session -t $(tmux ls | fzf | cut -d':' -f1)
}


bind -m emacs-standard -x '"\C-t": tmux-select'
bind -m vi-command -x '"\C-t": tmux-select'
bind -m vi-insert -x '"\C-t": tmux-select'

alias zshconfig="nvim ~/.zshrc"

alias \
	cp="cp -iv" \
	mv="mv -iv" \
	rm="trash" \
	mkd="mkdir -pv" \
	yt="youtube-dl --add-metadata -i" \
	yta="yt -x -f bestaudio/best" \
	ffmpeg="ffmpeg -hide_banner"

alias \
	ka="killall" \
	g="git" \
	trem="transmission-remote" \
	YT="youtube-viewer" \
	sdn="sudo shutdown -h now" \
	v="nvim" \
	p="sudo pacman" \
	l="ls -al" \
	z="zathura"

alias \
	mux="tmuxcator"


