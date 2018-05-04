export ZSH=/Users/matheus/.oh-my-zsh

ZSH_THEME="zeit"

plugins=(git osx history)

source $ZSH/oh-my-zsh.sh

# path
export PATH=/usr/local/Cellar/openvpn/2.4.1/sbin:$PATH
export PATH=/Users/matheus/dev/zeit/scripts:$PATH
export PATH=/Users/matheus/.config/yarn/global/node_modules/.bin:$PATH

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
alias zeit='cd /Users/matheus/dev/zeit'
alias a='atom .'
alias jqsp='jq .scripts package.json'
alias ezshrc='vi ~/.zshrc && source ~/.zshrc'
alias evimrc='vi ~/.vimrc'
alias spot='spot --exclude dist --exclude app/dist --exclude node_modules --exclude .next'
alias gpdb='gp && gp --tags && db -y && say ready to deploy'
alias gpr='gp && gp --tags && say ready to release && release'
gclone() {
  IFS='/' read org repo <<< "$1"
  if [ -z "$repo" ]
  then
  repo=$org
  org='zeit'
  fi
  git clone git@github.com:$org/$repo.git
}
alias gcnv='gc --no-verify'
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
api() {
  http $ZEIT_API_URL$1 "${@:2}" "$ZEIT_API_AUTH"
}
alias dev='cd /Users/matheus/dev'
alias gpt='git push && git push --tags'
alias vip='vi package.json'
alias p8='ping 8.8.8.8'
alias vi='vim'
alias fix-dns='sudo killall -HUP mDNSResponder'

# secret stuff
source $HOME/.secrets

# make zsh's `time` not suck
disable -r time
alias time='time -p '

# gcloud
if [ -f '/Users/matheus/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/matheus/Downloads/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/matheus/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/matheus/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# gpg agent via https://github.com/pstadler/keybase-gpg-github
if test -f ~/.gnupg/.gpg-agent-info -a -n "$(pgrep gpg-agent)"; then
  source ~/.gnupg/.gpg-agent-info
  export GPG_AGENT_INFO
  GPG_TTY=$(tty)
  export GPG_TTY
else
  eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
fi
