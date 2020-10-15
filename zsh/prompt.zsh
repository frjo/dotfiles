# Prompt.

precmd() {
  vcs_info
}

PROMPT='[%32<…<%~%<<]${vcs_info_msg_0_}$(prompt_char) '
SPROMPT="%F{red}%R →%f %F{green}%r?%f (Yes, No, Abort, Edit) "
