export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="zeit"

plugins=(git osx history)

source $ZSH/oh-my-zsh.sh
source `which import`
# path
export PATH=/usr/local/Cellar/openvpn/2.4.1/sbin:$PATH
export PATH=$HOME/dev/zeit/scripts:$PATH
export PATH=$HOME/.config/yarn/global/node_modules/.bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/go/bin:$PATH
export PATH=/snap/bin:$PATH
[ `uname` = 'Darwin' ] && export PATH=$(brew --prefix)/bin:$(brew --prefix)/sbin:$PATH

export EDITOR='vim'

# npm
alias nis='npm i -S'
alias nig='npm i -g'
alias nid='npm i -D'

# yarn
alias ya='yarn add'
alias yad='yarn add --dev'
alias yag='yarn add --global'
alias yra='yarn run app'
alias yrd='yarn run dev'
alias yrs='yarn run start'
alias yrt='yarn run test'
alias yr='yarn run'

# misc aliases
alias zeit='cd $HOME/dev/zeit'
alias a='atom .'
alias jqsp='jq .scripts package.json'
alias ezshrc='vi ~/.zshrc && source ~/.zshrc'
alias evimrc='vi ~/.vimrc'
alias spot='spot --exclude dist --exclude app/dist --exclude node_modules --exclude .next'
alias gpdb='gp && gp --tags && db -y && _say ready to deploy'
alias gpr='gp && gp --tags && _say ready to release && release'
gclone() {
  IFS='/' read org repo <<< "$1"
  if [ -z "$repo" ]
  then
  repo=$org
  org='zeit'
  fi
  git clone git@github.com:$org/$repo.git
}
opr() {
  local REMOTE=origin
  if [ -n "$1" ]
  then
    REMOTE=$1
  fi
  local REPO=`git remote -v | grep -m 1 $REMOTE | awk -F '[:.]' '{print $3}'`
  local BRANCH=`git rev-parse --abbrev-ref HEAD`
  open "https://github.com/$REPO/pull/new/$BRANCH"
}
ogh() {
  # will either contain the full path of the current directory,
  # relative to the repo root or nothing if the current directory
  # is the repo root
  local dir="$(git ls-tree --full-name --name-only HEAD ../$(basename $(pwd)) 2>/dev/null)"
  local branch=`git rev-parse --abbrev-ref HEAD`
  open "https://github.com/$(git remote -v | grep -m 1 origin | awk -F '[:.]' '{print $3}')/tree/$branch/$dir"
}
gpft() {
  local REMOTE=origin
  if [ -n "$1" ]
  then
    REMOTE=$1
  fi
  local BRANCH=`git rev-parse --abbrev-ref HEAD`

  git push --set-upstream $REMOTE $BRANCH
}
alias hide_desktop='defaults write com.apple.finder CreateDesktop false; killall Finder'
alias show_desktop='defaults write com.apple.finder CreateDesktop true; killall Finder'
alias dev='cd $HOME/dev'
alias gpt='git push && git push --tags'
alias vip='vi package.json'
alias p8='ping 8.8.8.8'
alias vi='vim'
alias fix_dns='sudo killall -HUP mDNSResponder'
fix_routes() {
  sudo ifconfig en0 down
  sudo route flush
  sudo ifconfig en0 up
}
alias gce='gcloud compute'
sgh() {
  _type="Code"
  org=""
  query=""
  while [ "$#" -gt 0 ]; do
    case "$1" in
      -i|--issues|-p|--pr|--prs) _type="Issues"; shift 1;;
      --commit|--commits) _type="Commits"; shift 1;;
      --code) _type="Code"; shfit 1;;
      -w|--wiki|--wikis) _type="Wikis"; shift 1;;
      -o|--org|--orgs) org+="$2"; shift 2;;
      -r|--repo|--repos) _type="Repositories"; shift 1;;
      -*)
        echo >&2 "Unknown option \"$1\""
        return 1
        ;;
      *) query+="$1 "; shift 1;;
    esac
  done

  if [ "$org" != "" ]; then
    query+="org:$org"
  fi

  query+="&type=$_type"

  open "https://github.com/search?q=$query"
}
_say() {
  # uses `say(1)` to say something if it's available
  # (i.e. if we're on macOS)
  # if not, just a no-op
  if command -v say >/dev/null 2>&1; then
    # we use & because `say` blocks
    # we use `sh -c ''` because `&` prints some stuff we don't want to print
    say $*
  fi
}

import matheuss/bawk

# secret stuff
source $HOME/.secrets

# make zsh's `time` not suck
disable -r time
alias time='time -p '

# gcloud
if [ -f "$HOME/Downloads/google-cloud-sdk/path.zsh.inc" ]; then source "$HOME/Downloads/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc" ]; then source "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc"; fi

# gpg agent via https://github.com/pstadler/keybase-gpg-github
#if test -f ~/.gnupg/.gpg-agent-info -a -n "$(pgrep gpg-agent)"; then
#  source ~/.gnupg/.gpg-agent-info
#  export GPG_AGENT_INFO
#  GPG_TTY=$(tty)
#  export GPG_TTY
#else
#  eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
#fi

alias w='watch '

alias p1='ping 1.1.1.1'
alias p8='ping 8.8.8.8'
