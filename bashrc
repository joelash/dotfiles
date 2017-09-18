source ~/.bash/functions
for file in ~/.bash/*.sh; do
  source $file
done
source ~/.bash/aliases

if [ -f ~/.bash/private ]; then
  . ~/.bash/private
fi

# homebrew
export BREW_HOME=/usr/local/bin
export BREW_SBIN=/usr/local/sbin
export PATH=$BREW_SBIN:$BREW_HOME:$PATH
export PATH=$HOME/.bin:$PATH

export EDITOR=vim
export SVN_EDITOR=/usr/bin/vim

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# # boot2docker
# export DOCKER_HOST=tcp://192.168.59.103:2376
# export DOCKER_CERT_PATH=/Users/joelash/.boot2docker/certs/boot2docker-vm
# export DOCKER_TLS_VERIFY=1

# prompt
export YELLOW='\[\033[1;33m\]' # Yellow
export WHITE='\[\033[1;37m\]' # White
export CYAN='\[\033[1;36m\]' # CYAN
export TEXT_RESET='\[\033[00m\]'
export BLACK='\[\033[1;30m\]' # White

# Alias to create 'realias' that does half the work for me
alias realias='$EDITOR ~/.bash/aliases; source ~/.bash/aliases'

# RVM (ruby version management)
if [[ -f ./.rvmrc ]] ; then source ./.rvmrc ; fi

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

PATH=$PATH:/usr/local/share/npm/bin # Add node to path

function git_initials {
  local initials=$(git config --get user.initials)
  if [[ -n "${initials}" ]]; then
    echo "[${initials}] "
  fi
}

if [ -n "$PS1" ]; then
  export PS1="\$(git_initials)\$(truncated_pwd 3)\$(__parse_git_branch__) -> "
  export PS2='> '

  BASE16_SHELL=$HOME/src/github/base16-shell/
  [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
  _t
  [ -f ~/.fzf.bash ] && source ~/.fzf.bash
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

eval "$(scmpuff init -s)"

### HH History
# export HH_CONFIG=hicolor         # get more colors
# shopt -s histappend              # append new history items to .bash_history
# export HISTCONTROL=ignorespace   # leading space hides commands from history
# export HISTFILESIZE=10000        # increase history file size (default is 500)
# export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"   # mem/file sync
# # if this is interactive shell, then bind hh to Ctrl-r (for Vi mode check doc)
# if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hh -- \C-j"'; fi

export PROMPT_COMMAND="history -a ~/.bash_history.global"
bind -x '"\C-r": "~/.swap_history_reverse.sh"'

# if [ -f /usr/local/share/liquidprompt ]; then
#   . /usr/local/share/liquidprompt
# fi
