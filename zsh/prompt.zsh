# Prompt.

precmd() {
  vcs_info
}

PROMPT='[%32<…<%~%<<]${vcs_info_msg_0_}$(prompt_char) '
SPROMPT="$fg[red]%R →$reset_color $fg[green]%r?$reset_color (Yes, No, Abort, Edit) "
