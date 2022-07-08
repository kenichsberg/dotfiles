export LANG=ja_JP.UTF-8
export PATH="$PATH:/usr/local/opt/icu4c/bin"
export PATH="$PATH:/usr/local/opt/icu4c/sbin"
export PATH="$PATH:/usr/local/Cellar/postgresql/13.1/bin"
export ANDROID_SDK=/Users/tsc/Library/Android/sdk
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="$PATH:/opt/local/bin:/opt/local/sbin"
export PATH="$PATH:$HOME/.tmux"
export MANPATH="$PATH:/opt/local/man"

export NVM_DIR="${HOME}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# golang
export GOROOT=/usr/local/Cellar/go/1.16.2/libexec
export GOPATH=$HOME/.go
export PATH=$PATH:$GOROOT:$GOPATH/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin
