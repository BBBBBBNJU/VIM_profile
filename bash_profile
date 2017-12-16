export TERM="xterm-256color"

tmux_init()
{
    session=msra
    tmux new-session -s "$session" -d -n "local"     # 开启一个会话
    tmux split-window -h                # 开启一个竖屏
    tmux split-window -v                # 开启一个横屏,并执行top命令
    tmux select-pane -L
    # tmux send -t "$session:local" 'vim' Enter
    tmux -2 attach-session -d           # tmux -2强制启用256color，连接已开启的tmux
    
}

# 判断是否已有开启的tmux会话，没有则开启
if which tmux 2>&1 >/dev/null; then
    test -z "$TMUX" && (tmux attach || tmux_init)
fi
export PATH="/home/v-hayan1/anaconda2/bin:$PATH"

alias vetf='source activate tensorflow'
alias qvetf='source deactivate tensorflow'
alias vetf3='source activate tensorflow3'
alias qvetf3='source deactivate tensorflow3'

if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
export PATH=/usr/local/go/bin:$PATH

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda-8.0/lib64:/usr/local/cuda/extras/CUPTI/lib64"
export CUDA_HOME=/usr/local/cuda-8.0

