# Completion
setopt always_to_end
setopt auto_menu
setopt complete_in_word
setopt no_menu_complete # do not autoselect the first completion entry
setopt no_auto_remove_slash

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>' # Like default, but without / -- ^W must be useful in paths, like it is in vim, bash, tcsh

# Enable completion caching, use rehash to clear
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path $ZDOTDIR/cache/

# List of completers to use.
zstyle ':completion:*' menu select=2 _complete _ignored _approximate
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

zstyle ':completion:*' expand true # Expand partial paths.
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' verbose true
zstyle ':completion:*' insert-tab pending # Pasting with tabs doesn't perform completion
zstyle ':completion:*' matcher-list "m:{a-zA-Z-_}={A-Za-z_-}" # Ignore case and hypfen.
zstyle ':completion:*' list-colors '' # Fallback to built in ls colors.
zstyle ':completion:*:functions' ignored-patterns "_*"
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:rm:*' ignore-line true
zstyle '*' single-ignored show
#zstyle ':completion:*' group-name ''
