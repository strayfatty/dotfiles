# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -la --color=auto'
alias grep='grep --color=auto'
PS1='\W> '

# ssh
eval `ssh-agent` &>/dev/null
ssh-add ~/.ssh/*.key &>/dev/null
