# dotfiles

## Steps

- Install `brew`:

`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

- Install the latest `git`:

`brew install git`

- Configure Git author:

```
git config --global user.name 'Matheus Fernandes'
git config --global user.email 'github@matheus.top'
```

- Clone this repository:

`git clone git@github.com:pstadler/keybase-gpg-github.git`

- Set up SSH and GPG keys:

- Set up GPG and commit signing:

```
brew install gpg keybase gpg-agent pinentry-mac
git config --global gpg.program
git config --global gpg.program gpg2
git config --global user.signingkey <GPG KEY ID>
```
