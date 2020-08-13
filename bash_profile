# .bash_profile

# running as bash
if [ -n "$BASH_VERSION" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad

PAGE=less

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export PATH="$HOME/.cargo/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/joelash/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/joelash/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/joelash/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/joelash/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

