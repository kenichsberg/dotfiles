# aliases
alias ls='ls --color=auto -laFh'
alias ll='ls --color=auto -laFh'
alias lg='lazygit'
alias vi='nvim'
alias nv='neovide'
alias ij='/home/ken/idea-IC-241.18034.62/bin/idea'


# envs
export PATH=$PATH:$HOME/bin
export PATH="$PATH:/opt/nvim-linux64/bin"

export EDITOR="nvim"
export VISUAL="nvim"

## locale
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"

## java
export JAVA_HOME=/usr/lib/jvm/java-23-openjdk-amd64
export PATH=$PATH:$JAVA_HOME/bin 
export M2_HOME=/opt/apache-maven-3.9.9
export PATH=$PATH:$M2_HOME/bin 

## scala
export PATH=$PATH:~/.local/share/coursier/bin

## clojure
export PATH=$PATH:~/.vim/plugged/vim-iced/bin
export CLJ_KONDO_EXTRA_CONFIG_DIR="$HOME/.config/clj-kondo/extra-config.edn"

## golang
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

## node.js
export VOLTA_HOME="${HOME}/.volta"
export PATH=$VOLTA_HOME/bin:$PATH

## emacs
export PATH=$PATH:$HOME/.emacs.d/bin
export LSP_USE_PLISTS=true
. "$HOME/.cargo/env"


# functions
## zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

## .zsh_history
HISTFILE=~/.zsh_history
HISTSIZE=500000
SAVEHIST=500000
setopt appendhistory
setopt INC_APPEND_HISTORY  
setopt SHARE_HISTORY

## terraforrm
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
