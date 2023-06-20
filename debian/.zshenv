export PATH=$PATH:$HOME/bin

# node.js
export VOLTA_HOME="${HOME}/.volta"
export PATH=$VOLTA_HOME/bin:$PATH

# golang
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# java
export JAVA_HOME=/opt/jdk-17.0.1+12
export PATH=$PATH:$JAVA_HOME/bin 

# clojure
export PATH=$PATH:~/.vim/plugged/vim-iced/bin

# emacs
export PATH=$PATH:$HOME/.emacs.d/bin
export LSP_USE_PLISTS=true
. "$HOME/.cargo/env"
