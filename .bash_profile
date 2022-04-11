export CODESIGNBUREAU_CREDFILE=/Users/dabarrag/Documents/CSS/dabarrag_config.properties

_GREEN=$(tput setaf 2)
_BLUE=$(tput setaf 4)
_RED=$(tput setaf 1)
_YELLOW=$(tput setaf 228)
_RESET=$(tput sgr0)
_BOLD=$(tput bold)
export PS1="\[${_YELLOW}\]\t\[${_RESET}\]\[${_BOLD}\] \W \$ \[${_RESET}\]"


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Set up the proxy on your Mac
# export http_proxy=http://www-proxy.us.oracle.com:80/
# export https_proxy=http://www-proxy.us.oracle.com:80/

#function run
run() {
    number=$1
    shift
    for i in `seq $number`; do
      $@
    done
}

alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'