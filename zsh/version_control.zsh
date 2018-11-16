# Load version control information.
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats "%{$fg[green]%}(%b%{$reset_color%}%{$fg[yellow]%}%u%{$reset_color%}%{$fg[green]%}%c)%{$reset_color%}"
zstyle ':vcs_info:git*' actionformats "%{$fg[green]%}(%b)%{$reset_color%}%{$fg[yellow]%}(%a)%{$reset_color%}"
zstyle ':vcs_info:git*' check-for-changes true
zstyle ':vcs_info:git*' unstagedstr '+'
zstyle ':vcs_info:git*' stagedstr '+'

#zstyle ':vcs_info:*' enable git bzr
#zstyle ':vcs_info:(git|bzr)*' formats "%{$fg[green]%}(%b%{$reset_color%}%{$fg[yellow]%}%u%{$reset_color%}%{$fg[green]%}%c)%{$reset_color%}"
#zstyle ':vcs_info:bzr:*' use-simple true

# Limit git completion to local files
__git_files () {
    _wanted files expl 'local files' _files
}
