# .bash_profile
 
# running as bash
if [ -n "$BASH_VERSION" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad
