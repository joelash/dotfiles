source ~/.bash/functions
source ~/.bash/aliases

source ~/bin/git-completion.bash

# Need to DO THIS
#export PATH=/usr/local/jruby/bin:/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/site/apps/jruby-1.4.0/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

export DYLD_LIBRARY_PATH=/opt/local/29West/LBM_3.6.2/Darwin-9.8.0-x86_64/lib

export NODE_PATH=/usr/local/lib/node


# MacPorts Installer addition on 2009-06-24_at_13:26:05: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH=/opt/local/share/man:$MANPATH
# Finished adapting your MANPATH environment variable for use with MacPorts.

export EDITOR=/usr/bin/vim
export SVN_EDITOR=/usr/bin/vim

# prompt
export YELLOW='\[\033[1;33m\]' # Yellow
export WHITE='\[\033[1;37m\]' # White
export CYAN='\[\033[1;36m\]' # CYAN
export TEXT_RESET='\[\033[00m\]'

#export PS1="\u \W$YELLOW \$(parse_git_branch)$WHITE$ "
export PS1="$TEXT_RESET$WHITE\W$TEXT_RESET $YELLOW\$(parse_git_branch)$CYAN \$(parse_rvm_gemset)$TEXT_RESET -> "
#export PS1="\u \W$ "
 
# set default mode to vi!!! this is awesome
set -o vi
bind -m vi-command -r 'v'

# Alias to create 'realias' that does half the work for me
alias realias='$EDITOR ~/.bash/aliases; source ~/.bash/aliases'

#CLASSPATH=/Users/jfriedman/Documents/work/clojure:/opt/jars/clojure-contrib.jar:/opt/jars/clojure.jar:/opt/jars/vimclojure.jar
#CLOJURE_EXT=/opt/jars/

# Build Classpath interactively for earlier versions of Java.
# Assumed JAR file location is /opt/jars directory - change appropriately for yourself
# Make sure to use backquotes (`) on the first line
for i in `ls /opt/jars/*.jar`
do
  CLASSPATH=${CLASSPATH}:${i}
done

# RVM (ruby version management)
if [[ -s /Users/jfriedman/.rvm/scripts/rvm ]] ; then source /Users/jfriedman/.rvm/scripts/rvm ; fi

rvm use ruby-1.9.1
