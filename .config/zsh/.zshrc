# set the directory to store zinit and plugins
export ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# download zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# load zinit
source "${ZINIT_HOME}/zinit.zsh"

# add zinit plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# completions
autoload -Uz compinit && compinit -d $HOME/.zcompdump
setopt noautomenu
setopt nomenucomplete

# history
HISTSIZE=100000                     # maximum events for internal history
HISTFILE="$ZSH_HOME/zsh_history"    # history filepath
SAVEHIST=$HISTSIZE                  # maximum events in history file
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# cutomize prompt
eval "$(oh-my-posh init zsh --config $XDG_CONFIG_HOME/oh-my-posh/zen.toml)"

# keybinds (emacs-mode)
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^k' history-search-backward
bindkey '^j' history-search-forward

# completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:*' continuous-trigger 'TAB'

# aliases
alias ls='ls -la --color'
alias home="ssh home"

# Shell integrations
# TODO combine fzf calls
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fzf --zsh)"
eval "$(fnm env --use-on-cd)"

# PRIVATE
[ -f "$HOME/.config/zsh/.zshrc_private" ] && source "$HOME/.config/zsh/.zshrc_private"
