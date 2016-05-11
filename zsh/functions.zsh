tabname() { printf "\e]1;$1\a" }
winname() { printf "\e]2;$1\a" }
is_mac() { [[ $OSTYPE == darwin* ]] }
mcd() { mkdir -p "$1" && cd "$1"; }
md5() { echo -n $1 | openssl md5 /dev/stdin }
sha1() { echo -n $1 | openssl sha1 /dev/stdin }
sha256() { echo -n $1 | openssl dgst -sha256 /dev/stdin }
sha512() { echo -n $1 | openssl dgst -sha512 /dev/stdin }
rot13() { echo $1 | tr "A-Za-z" "N-ZA-Mn-za-m" }
rot47() { echo $1 | tr "\!-~" "P-~\!-O" }
urlencode() { python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])" $1 }
urldecode() { python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])" $1 }
last_modified() { ls -t $* 2> /dev/null | head -n 1 }

ex() {
  if [[ -f $1 ]]; then
    case $1 in
      *.tar.bz2) tar xvjf $1;;
      *.tar.gz) tar xvzf $1;;
      *.tar.xz) tar xvJf $1;;
      *.tar.lzma) tar --lzma xvf $1;;
      *.bz2) bunzip $1;;
      *.rar) unrar $1;;
      *.gz) gunzip $1;;
      *.tar) tar xvf $1;;
      *.tbz2) tar xvjf $1;;
      *.tgz) tar xvzf $1;;
      *.zip) unzip $1;;
      *.Z) uncompress $1;;
      *.7z) 7z x $1;;
      *.dmg) hdiutul mount $1;; # mount OS X disk images
      *) echo "'$1' cannot be extracted via >ex<";;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

path() {
  echo $PATH | tr ":" "\n" | \
    awk "{ sub(\"/usr\",   \"$fg_no_bold[green]/usr$reset_color\"); \
           sub(\"/bin\",   \"$fg_bold[blue]/bin$reset_color\"); \
           sub(\"/sbin\",  \"$fg_bold[magenta]/sbin$reset_color\"); \
           sub(\"/local\", \"$fg_no_bold[yellow]/local$reset_color\"); \
           sub(\"/opt\",   \"$fg_no_bold[cyan]/opt$reset_color\"); \
           sub(\"/Users\", \"$fg_no_bold[red]/Users$reset_color\"); \
           sub(\"/home\",  \"$fg_no_bold[red]/home$reset_color\"); \
           print }"
}

prompt_char() {
  git branch >/dev/null 2>/dev/null && echo '±' && return
  bzr root >/dev/null 2>/dev/null && echo '↥' && return
  if [[ $USER == "root" ]]; then
    echo '#'
  elif (( $# == 0 )); then
    echo '$'
  else
    echo $1
  fi
}
