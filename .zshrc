#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(fasd --init auto)"

swurxvt() {
   ln -sf $HOME/cfg/colors/$1 $HOME/cfg/colors/default
   xrdb ~/.Xresources
}

compdef "_files -W $HOME/cfg/colors" swurxvt

timer_sec() {
date1=`date +%s.%N`; while true; do
   echo -ne "$(date -u --date @$((`date +%s.%N` - $date1)) +%H:%M:%S.%N)\r";
done
}

alias sd='cd $SDMAIN'
alias cr='cd $HOME/go/src/github.com/cockroachdb/cockroach'
alias caps='xdotool key Caps_Lock'
alias CAPS='xdotool key Caps_Lock'

vim() {
i3-msg '[title="emacs"] focus'
emacsclient -e '(find-file-other-frame "'`readlink -f $1`'")'
for var in "${@:2}"
do
    emacsclient -e '(spacemacs/find-file-split "'`readlink -f $var`'")'
done
}
