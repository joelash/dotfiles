source ~/.bash/functions
for file in ~/.bash/*.sh; do
  source $file
done
source ~/.bash/aliases
source ~/src/github/base16-shell/base16-chalk.dark.sh
source ~/src/github/base16-shell/base16-monokai.dark.sh

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

if [ -f ~/.bash/private ]; then
  . ~/.bash/private
fi

# homebreq
export BREW_HOME=/usr/local/bin
export BREW_SBIN=/usr/local/sbin
export PATH=$BREW_SBIN:$BREW_HOME:$PATH

export APP_ENV=development

export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
export SVN_EDITOR=/usr/bin/vim

# boot2docker
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/joelash/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

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

export PS1="\$(git_initials)\$(truncated_pwd 3)\$(parse_git_branch) -> "

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

_t

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
