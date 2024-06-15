fpath+=(
  $ZDOTDIR/zsh-completions(N)
  /usr/local/share/zsh/site-functions(N)
  /opt/homebrew/share/zsh/site-functions(N)
)
fignore+=.DS_Store

# Modules
autoload -Uz bashcompinit && bashcompinit # Support Bash completion files
autoload -Uz colors && colors
autoload -Uz compinit && zmodload -i zsh/complist && compinit -i
autoload -Uz edit-command-line && zle -N edit-command-line
autoload -Uz url-quote-magic && zle -N self-insert url-quote-magic
autoload -Uz select-word-style && select-word-style bash
autoload -Uz zmv

# Settings
setopt auto_cd
setopt auto_name_dirs
setopt auto_pushd
setopt extended_glob
setopt interactive_comments
setopt multios
setopt no_beep
setopt no_nomatch # Don't error when there's nothing to glob, leave it unchanged (HEAD^ and similar)
setopt prompt_subst
setopt pushd_ignore_dups
setopt transient_rprompt
