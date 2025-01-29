# export CODESIGNBUREAU_CREDFILE=/Users/dabarrag/Documents/CSS/dabarrag_config.properties

TERM='xterm-256color';
_GREEN=$(tput setaf 2);
_BLUE=$(tput setaf 4);
_RED=$(tput setaf 1);
_YELLOW=$(tput setaf 228);
_RESET=$(tput sgr0);
_BOLD=$(tput bold);
export PS1="\[${_YELLOW}\]\t\[${_RESET}\]\[${_BOLD}\] \W \$ \[${_RESET}\]";


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize;

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

json() {
    #do things with parameters like $1 such as
    if [ $# -eq 0 ]; then
      jsonFiles=( $(find . -iname '*.json' ) )
      PS3="Your choice: "
      select DOMAIN in "${jsonFiles[@]}"; do
          if [[ $DOMAIN ]]; then
              cat "$DOMAIN" | jq .
              break
          else
              echo "Error: Invalid choice '$REPLY'"
          fi
      done

    else 
      cat "$1" | jq .
    fi
}



# alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
eval "$(/opt/homebrew/bin/brew shellenv)";

export BASH_SILENCE_DEPRECATION_WARNING=1;




export PATH="/opt/homebrew/opt/node@16/bin:$PATH"

if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007";';
fi

. /opt/homebrew/etc/profile.d/z.sh

alias la="ls -lah";
alias mongodbbu="cd ~/scripts/ && ./mongodb_bu.sh";
alias .="pwd";
alias ..="cd ..";
alias tac="tail -r ";
alias m='f(){ mkdir "$@";  cd $@; }; f'
alias pip="python3 -m pip"
alias muestra="java -jar /Users/dabarrag/projects/java/muestra/target/Cuentas-4.0-jar-with-dependencies.jar"
alias fzf="fzf -i -m --ansi --color dark --border rounded -q '!node_modules ' --preview 'less {}'"

source "/opt/homebrew/opt/fzf/shell/completion.bash"
source "/opt/homebrew/opt/fzf/shell/key-bindings.bash"

alias gita="git add"
alias gits="git status"
alias gitb="git branch -a"
gitc() {
  git commit -m "$*"
}