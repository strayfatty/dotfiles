# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

alias ls='ls -hal --group-directories-first --color=auto'
alias grep='grep --color=auto'
alias minecraft='flatpak run org.prismlauncher.PrismLauncher'
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

# nvm
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# cargo/rust
if [[ $PATH != *"$HOME/.cargo/bin"* ]]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

# pnpm
export PNPM_HOME="/home/mclee/.local/share/pnpm"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.bun/bin:$PATH"

# opencode
export PATH="$HOME/.opencode/bin:$PATH"
