# Shortcuts
alias mf="cd $HOME/src/github.com/mfridman"
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias reloadshell="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias tf="terraform"
# alias ll="/usr/local/opt/coreutils/libexec/gnubin/ls -AhlFo --color --group-directories-first"
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias c="clear"
alias e="exit"
alias gt="gittower ."
alias uuidgen='uuidgen | tr "[:upper:]" "[:lower:]"'
alias python='python3'
alias pip='pip3'

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias downloads="cd $HOME/Downloads"

# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"

# Docker

# Git
alias gst="git status"
alias gb="git branch"
alias b="git checkout -b"
alias gco="git checkout"
alias gl="git log --oneline --decorate --color"
alias amend="git add . && git commit --amend --no-edit"
alias commit="git add . && git commit -m"
alias gitroot='cd $(git rev-parse --show-toplevel)'
# alias diff="git diff"
alias force="git push --force"
alias nuke="git clean -df && git reset --hard"
alias pop="git stash pop"
alias pull="git pull"
alias push="git push"
alias resolve="git add . && git commit --no-edit"
alias stash="git stash -u"
alias unstage="git restore --staged ."
alias wip="commit wip"
alias unwip="git reset --mixed HEAD~1"
