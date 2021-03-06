# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

########################
# original scripts
########################
alias ls='gls --color=auto -laFh'

alias find=gfind
alias xargs=gxargs
export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
export PATH="$PATH:`yarn global bin`"

# disable Ctrl + s/q
unsetopt flow_control
setopt no_flow_control
# disable stty (For env WITHOUT zinit)
#stty stop undef
#stty start undef
#stty ixany

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

function dirdiff()
{
  # Shell-escape each path:
  DIR1=$(printf '%q' "$1"); shift
  DIR2=$(printf '%q' "$1"); shift
  vim $@ -c "DirDiff $DIR1 $DIR2"
}

# prompt formatting (For env WITHOUT zinit)
#export PROMPT='%F{blue}%T%f %F{cyan]}%n %B%1~%b%f %F{cyan}%B%#%b%f '
########################

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

zinit light "romkatv/powerlevel10k"
zinit light "zsh-users/zsh-completions"
zinit light "zsh-users/zsh-autosuggestions"

### End of Zinit's installer chunk

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Autostart if not already in tmux.
if [[ ! -n $TMUX ]]; then
  tmux new-session -s tsc -d
fi

# ghcup
[ -f "/Users/tsc/.ghcup/env" ] && source "/Users/tsc/.ghcup/env" # ghcup-env
