export JAVA_HOME=$(/usr/libexec/java_home)
export PATH="$PATH:/usr/local/bin"
export PATH="/usr/local/git/bin:/sw/bin:/usr/local/bin:/usr/local:/usr/local/sbin:/usr/local/mysql/bin:$PATH"

alias ack='ack --color-filename="red bold" --color-match="yellow bold" --color-lineno=white'

alias be='bundle exec'

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

# ------------------------------------------------------------------------------------------
alias sshlebara='ssh deploy@10.1.23.81'
alias sshtest='ssh deploy@10.1.25.183'
alias sshstage='ssh deploy@10.1.25.193'
alias sshprodbank='ssh deploy@10.1.25.1'
alias jenkins='ssh deploy@10.1.25.51'
alias ssctest='ssh root@10.1.33.17' #logs are under "/home/SSC/Progs/traces/"
alias sscprod='ssh root@10.1.33.13'

alias apmc='sshtest && cd /www/app_manager.fidor.de/rails/current/ && RAILS_ENV=production bundle exec rails c'

# remove all directories except one
rme (){
  if [ $# -eq 0 ]; then
    echo "provide a name of the directory you don't want to remove"
  else
    find . -maxdepth 1 ! -name "$1" ! -name '.*' | xargs rm -rf
  fi
}

#define variables for www09 and www10 machines
www09='www09.fidor.intern'
www10='www10.fidor.intern'
alias www09='ssh deploy@$www09'
alias www10='ssh deploy@$www10'
#alias tailapi='multitail -l ssh deploy@www09 "tail -f /some/log/file" -l ssh deploy@www10 "tail -f /some/log/file"'

sshprod() {
    #do things with parameters like $1 such as
    if [ "$1" = apm ]
    then
      echo "ssh to fucking APM on fucking production"
      ssh deploy@10.1.23.193
    elif [ "$1" = aps ]
    then
      echo "ssh to fucking APS on fucking production"
      ssh deploy@10.1.23.194
    elif [ "$1" = bo1 ]
    then
      echo "ssh to fucking Backoffice 1 on fucking production"
      ssh deploy@10.1.23.110
    elif [ "$1" = bo2 ]
    then
      echo "ssh to fucking Backoffice 2 on fucking production"
      ssh deploy@10.1.23.111
    else
      echo "Provide the option: apm, aps, bo1, bo2 or FUCK OFF, SUCKER!"
    fi
}
alias sshprod='sshprod'

tl(){
  #do things with parameters like $1 such as
  if [ "$1" = apm ]
  then
    echo "tail -f apm production.log"
    ssh -n deploy@10.1.23.193 "tail -f ../../www/app_manager.fidor.de/rails/current/log/production.log"
  elif [ "$1" = api ]
  then
    echo "tails API logs on www09 and www10"
      ssh -n deploy@$www09 "tail -f ../../www/banking.fidor.de/rails/current/log/logstash_api_middleware_production_tw.log" & ssh -n deploy@$www10 "tail -f ../../www/banking.fidor.de/rails/current/log/logstash_api_middleware_production_tw.log" &
  else
    echo "Provide the option: apm, api or fuck off big time!"
  fi

}

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
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Git branch in prompt.

parse_git_branch() {

    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

}

export PS1="\u@\h \W\[\033[31m\]\$(parse_git_branch)\[\033[00m\] $ "

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
