# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

alias ls='ls -la --color=auto'
alias grep='grep --color=auto'
PS1='\W> '

# customize prompt
eval "$(oh-my-posh init bash --config "$XDG_CONFIG_HOME/oh-my-posh/zen.toml")"

# ssh
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h -s > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi

if [ ! -S "$SSH_AUTH_SOCK" ]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

ssh-add -t 8h $HOME/.ssh/*.key &>/dev/null

# cargo/rust
if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
fi

# fnm
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
    export PATH="$FNM_PATH:$PATH"
    eval "$(fnm env)"
fi
