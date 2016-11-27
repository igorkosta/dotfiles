if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# include .fidor if it exists
if [ -f $HOME/.fidor ]; then
    . $HOME/.fidor
fi

alias emacs="/usr/local/Cellar/emacs/24.5/Emacs.app/Contents/MacOS/Emacs -nw"

export JAVA_HOME=$(/usr/libexec/java_home)
export PATH="$PATH:/usr/local/bin"
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
export PATH="/usr/local/git/bin:/sw/bin:/usr/local/bin:/usr/local/Cellar:/usr/local:/usr/local/sbin:/usr/local/mysql/bin:$PATH"

export VISUAL=vim
export EDITOR="$VISUAL"

alias ack='ack --color-filename="red bold" --color-match="yellow bold" --color-lineno=white'

alias be='bundle exec'
alias g='git'

#if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

############# docker #############
export DOCKER_CERT_PATH=/Users/kostyuchenok/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376
alias b2d="boot2docker"
############# docker #############


export BLOCKSIZE=1k

#   Add color to terminal
#   (this is all commented out as I use Mac Terminal Profiles)
#   from http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
#   ------------------------------------------------------------
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad


# remove all directories except one
rme (){
  if [ $# -eq 0 ]; then
    echo "provide a name of the directory you don't want to remove"
  else
    find . -maxdepth 1 ! -name "$1" ! -name '.*' | xargs rm -rf
  fi
}

md ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}
export -f md

# start or stop mongodb
function mongodb() {
  brew services "$@" mongodb
}
export -f mongodb

# start or stop elasticsearch
function elastic() {
  brew services "$@" elasticsearch
}
export -f elastic

# start or stop cassandra
function cassandra() {
  brew services "$@" cassandra
}
export -f cassandra

# start or stop cassandra
function rabbit() {
  brew services "$@" rabbitmq
  if [ "$@" = start ]
  then
    # while ! nc -q 1 localhost 13000 </dev/null; do sleep 10; done
    open http://localhost:15672/
  fi
}
export -f rabbit

# pretty printed, colorful curl
function jcurl() {
    curl "$@" | json | pygmentize -l json
}
export -f jcurl

# ------------------------------------------------------------------------------------------

alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
    extract () {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }

#   ---------------------------
#   4.  SEARCHING
#   ---------------------------

alias qfind="find . -name "                 # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string

#   spotlight: Search for a file using MacOS Spotlight's metadata
#   -----------------------------------------------------------
    spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Git branch in prompt.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="️\u@\h \W\[\033[31m\]\$(parse_git_branch)\[\033[00m\] ☠️  λ "

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
# Add GHC 7.10.1 to the PATH, via https://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.10.1.app"
if [ -d "$GHC_DOT_APP" ]; then
  export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

$(boot2docker shellinit 2> /dev/null)

port() {
   lsof -nP -iTCP:$1 -sTCP:LISTEN
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# eval "$(jump shell bash)"
# alias j="jump"
