# brew installed binaries
export PATH="/usr/local/bin:${PATH}"

# fix for something I don't remember
export LC_ALL=en_US.UTF-8

# oh my zsh
export ZSH="/Users/vorant94/.oh-my-zsh"
ENABLE_CORRECTION="true"
plugins=(docker dotenv)
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
source $ZSH/oh-my-zsh.sh
autoload -U promptinit; promptinit
prompt typewritten

# aliases
alias pi-backup="sudo dd if=/dev/disk2 status=progress bs=16M | gzip >~/pi/full_\"$(date +%F)\".gz"
alias reset-launchpad="defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock"
alias reset-dock="defaults delete com.apple.dock; killall Dock"
alias update="mas upgrade && brew update && brew upgrade && brew upgrade --cask --greedy && brew cleanup && reset-launchpad && omz update"
alias brew-tree="brew leaves | xargs brew deps --installed --for-each | sed \"s/^.*:/$(tput setaf 4)&$(tput sgr0)/\""
alias npm-tree="npm list --global --depth=0"
alias rc-edit="nano ~/.zshrc"
alias rc-reload="source ~/.zshrc"

# node 16
export PATH="/usr/local/opt/node@16/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/node@16/lib"
export CPPFLAGS="-I/usr/local/opt/node@16/include"

# jdk 11
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
export CPPFLAGS="-I/usr/local/opt/openjdk@11/include"