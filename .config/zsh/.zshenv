# set the base directory for all zsh files
export ZDOTDIR="$HOME/.config/zsh"

# configure XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# zsh hom e
export ZSH_HOME="$XDG_DATA_HOME/zsh"
if [ ! -d $ZSH_HOME ]; then
   mkdir -p $ZSH_HOME
fi

# cargo / rust
source "$HOME/.cargo/env"

# go
export PATH="$PATH:/usr/local/go/bin:$HOME/go/bin"

# TODO homebrew exists
eval "$(/opt/homebrew/bin/brew shellenv)"

# TODO dotnet
export PATH="$PATH:$HOME/.dotnet:$HOME/.dotnet/tools"
export DOTNET_ROOT="$HOME/.dotnet"
export DOTNET_CLI_TELEMETRY_OPTOUT=true

# load private configuration
[ ! -f "$HOME/.config/zsh/.zshenv_private" ] || source "$HOME/.config/zsh/.zshenv_private"
