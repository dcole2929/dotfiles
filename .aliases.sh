#!/bin/bash

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop

# kube envs
alias staging-green="kubectl --kubeconfig=/Users/dfarmer/.kube/envs/tools-staging-green.ua-ecm.com.yaml"
alias staging-blue="kubectl --kubeconfig=/Users/dfarmer/.kube/envs/tools-staging-blue.ua-ecm.com.yaml"
alias staging-consumers="kubectl --kubeconfig=/Users/dfarmer/.kube/envs/tools-staging-consumers.ua-ecm.com.yaml"
alias prod-black="kubectl --kubeconfig=/Users/dfarmer/.kube/envs/tools-production-black.ua-ecm.com.yaml"
alias prod-red="kubectl --kubeconfig=/Users/dfarmer/.kube/envs/tools-production-red.ua-ecm.com.yaml"
alias prod-consumers="kubectl --kubeconfig=/Users/dfarmer/.kube/envs/tools-production-consumers.ua-ecm.com.yaml"

# publish an npm artifact for ua-checkout
ua-checkout-publish () {
  (cd ~/dev/ua-checkout && rm -rf node_modules/ && npm cache clear --force && npm install && npm run lint && npm run mocha && cd .. && npm publish ua-checkout)
}

ua-publish () {
  mydir=`pwd`
  (rm -rf node_modules/ && npm cache clear --force && npm install && npm run build:dll && npm run lint && npm run mocha && cd .. && npm publish $mydir)
}

alias teleport-mongo-staging='tsh --proxy teleport-data-staging.ua-ecm.com -l teleport-user ssh -L mongodb-staging:27017:192.168.150.10:19928 bastion'
alias teleport-mongo-prod='tsh --proxy teleport-data-prod.ua-ecm.com -l teleport-user ssh -L mongodb-production:27017:192.168.50.10:15903 bastion'
alias teleport-mssql-staging='tsh --proxy teleport-data-staging.ua-ecm.com -l teleport-user ssh -L 127.0.0.20:1433:ua-mssql-staging.cycp4qzg0cxv.us-east-2.rds.amazonaws.com:1433 bastion'
alias teleport-mssql-prod='tsh --proxy teleport-data-prod.ua-ecm.com -l teleport-user ssh \
    -L aws-production-sql:1433:ua-mssql-production.ct2obelbzcva.us-east-1.rds.amazonaws.com:1433 \
    -L aws-production-sql-reporting:1433:10.110.65.47:1433 \
    -L aws-production-sql-reporting:3389:10.110.65.47:3389 \
    bastion'

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

#alias vim="nvim"
#alias vimdiff="nvim -d"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume output volume 100'"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Docker
alias dockerips="docker ps -q | xargs -n 1 docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}} {{ .Name }}' | sed 's/ \// /'"

