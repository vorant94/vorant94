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
alias fix-appswitcher="defaults write com.apple.Dock appswitcher-all-displays -bool true; killall Dock"
alias upgrade="mas upgrade && brew update && brew upgrade && brew upgrade --cask --greedy && brew cleanup && reset-launchpad && omz update"
alias npm-tree="npm list --global --depth=0"
alias rc-edit="nano ~/.zshrc"
alias rc-reload="source ~/.zshrc"

# node 18
export PATH="/usr/local/opt/node@18/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/node@18/lib"
export CPPFLAGS="-I/usr/local/opt/node@18/include"

# jdk 11
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
export CPPFLAGS="-I/usr/local/opt/openjdk@11/include"

# python 3.11
export PATH="/usr/local/opt/python@3.11/libexec/bin:$PATH"
