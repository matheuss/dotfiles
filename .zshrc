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
# pnpm
export PNPM_HOME="/home/matheus/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# fnm
export PATH=/home/matheus/.fnm:$PATH
eval "`fnm env`"

export EDITOR='vim'

# misc aliases
alias vf='cd $HOME/dev/vercel'
alias jqsp='jq .scripts package.json'
alias spot='spot --exclude dist --exclude app/dist --exclude node_modules --exclude .next'
gclone() {
  IFS='/' read org repo <<< "$1"
  if [ -z "$repo" ]
  then
  repo=$org
  org='vercel'
  fi
  git clone git@github.com:$org/$repo.git
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
alias vi='vim'
alias fix_dns='sudo killall -HUP mDNSResponder'
fix_routes() {
  sudo ifconfig en0 down
  sudo route flush
  sudo ifconfig en0 up
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

alias vm='mosh vm.matheus.sh -- tmux a'

function wq() {
  watch -n 0.5 $@
}

get_cert_info () {
  echo | openssl s_client -showcerts -servername ${2:=$1} -connect $1:443 2> /dev/null | openssl x509 -inform pem -noout -text | egrep -i 'validity|not before|not after|issuer|dns'
}

get_ips_from_cidr() {
  # source: https://stackoverflow.com/questions/16986879/bash-script-to-list-all-ips-in-prefix/44001530
  nmap -sL -n $1 | awk '/Nmap scan report/{print $NF}'
}

unalias gcm
gcm() {
   branch="$(basename "$(git symbolic-ref --short refs/remotes/origin/HEAD)")"
   git checkout "$branch"
}

alias tf='terraform'
