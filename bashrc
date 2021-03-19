source ~/.bash/functions
for file in ~/.bash/*.sh; do
  source $file
done
source ~/.bash/aliases
source ~/.bash_completions/alacritty-completions.bash

if [ -f ~/.bash/private ]; then
  . ~/.bash/private
fi

# homebrew
export BREW_HOME=/usr/local/bin
export BREW_SBIN=/usr/local/sbin
export PATH=$BREW_SBIN:$BREW_HOME:$PATH
export PATH=$HOME/.bin:$PATH
export PATH=$HOME/Library/Python/2.7/bin:$PATH
export HOMEBREW_FORCE_BREWED_CURL=1

export EDITOR=vim
export SVN_EDITOR=/usr/bin/vim

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# # boot2docker
# export DOCKER_HOST=tcp://192.168.59.103:2376
# export DOCKER_CERT_PATH=/Users/joelash/.boot2docker/certs/boot2docker-vm
# export DOCKER_TLS_VERIFY=1

# Boot CLJ
BOOT_CLOJURE_NAME=org.clojure/clojure
BOOT_VERSION=2.8.3
BOOT_CLOJURE_VERSION=1.8.0

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
PATH=$PATH:$HOME/src/flutter/bin  # Add Flutter to path

export GEM_HOME=~/.gem

function git_initials {
  local initials=$(git mob-print --initials)
  if [[ -n "${initials}" ]]; then
    echo " [${initials}]"
  fi
}

if [ -n "$PS1" ]; then
  export PS1="\$(truncated_pwd 3)\$(git_initials)\$(__parse_git_branch__) -> "
  export PS2='> '

  if [ "$TERM_PROGRAM" != "Hyper" ]; then
    BASE16_SHELL=$HOME/src/github/base16-shell/
    [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
  fi
  _t
  [ -f ~/.fzf.bash ] && source ~/.fzf.bash
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export PATH="/Applications/Genymotion.app/Contents/MacOS/tools:$PATH" # Add GenyMotion tools

eval "$(scmpuff init -s)"

### HH History
# HSTR configuration - add this to ~/.bashrc
alias hh=hstr                    # hh to be alias for hstr
export HSTR_CONFIG=hicolor       # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# ensure synchronization between Bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi

bind -x '"\C-g": "vim $(fzf-tmux)"'

bind '"\e[Z":menu-complete'

# Display the list of matches when no further completion is possible
set show-all-if-unmodified on

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/joelash/.config/yarn/global/node_modules/tabtab/.completions/serverless.bash ] && . /Users/joelash/.config/yarn/global/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/joelash/.config/yarn/global/node_modules/tabtab/.completions/sls.bash ] && . /Users/joelash/.config/yarn/global/node_modules/tabtab/.completions/sls.bash

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /Users/joelash/src/github/dotfiles/mine/config/yarn/global/node_modules/serverless/node_modules/tabtab/.completions/slss.bash ] && . /Users/joelash/src/github/dotfiles/mine/config/yarn/global/node_modules/serverless/node_modules/tabtab/.completions/slss.bash

# AWS
export AWS_SDK_LOAD_CONFIG=1

### Python
### End Python

 export PATH="/usr/local/opt/node@12/bin:$PATH"

 eval "$(direnv hook bash)"
