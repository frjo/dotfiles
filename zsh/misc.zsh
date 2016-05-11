# Noglob
alias find="noglob find"
alias wget="noglob wget"

# Delete
bindkey '^[[3~' delete-char

if is_mac; then
    export EDITOR='bbedit --wait --resume'
else
    export EDITOR='vim'
fi

compdef mcd=cd
