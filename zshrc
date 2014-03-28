source ~/.zshuery/zshuery.sh
load_defaults
load_aliases
load_completion ~/.zshuery/completion
load_correction

prompts '[$(whoami)@local:$(COLLAPSED_DIR)$(virtualenv_info)]$(prompt_char) ' '%{$fg[red]%}$(ruby_version)%{$reset_color%}'

# History search
HISTSIZE=50000
SAVEHIST=50000
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '\e[A' up-line-or-beginning-search
bindkey '\e[B' down-line-or-beginning-search

# Don't error when there's nothing to glob, leave it unchanged (HEAD^ and similar)
setopt NO_NOMATCH

# Delete
bindkey '^[[3~' delete-char

if is_mac; then
    export EDITOR='bbedit'
else
    export EDITOR='vim'
fi

chpwd() {
    update_terminal_cwd
}

zstyle ':completion:*:*' ignored-patterns '*_HEAD'

__git_files () {
    _wanted files expl 'local files' _files
}

if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

if [ -f ~/.functions ] ; then
    source ~/.functions
fi

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
  export PATH=~/bin:"${PATH}"
fi
