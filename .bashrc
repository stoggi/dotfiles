# Jeremy Stott (jeremy@stott.co.nz)

# Enable bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Terminal colors enabled for osx native commands
export CLICOLOR=1

# Git PS1 prompt settings
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS="yes"
GIT_PS1_SHOWDIRTYSTATE=true

# PS1 prompt
export PS1='\[\033[01;34m\]\w\[\033[01;31m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '

# Chruby https://github.com/postmodern/chruby
if [ -f /usr/local/opt/chruby/share/chruby/chruby.sh ]; then
    source /usr/local/opt/chruby/share/chruby/chruby.sh
fi

# Create a dotfiles function that maps git to the bare dotfiles repo, and home directory
if [ -d $HOME/.dotfiles ]; then
    function dotfiles {
        /usr/local/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME $@
    }
fi

# Only load Liquid Prompt in interactive shells, not from a script or from scp
if [ -f /usr/local/share/liquidprompt ]; then
    [[ $- = *i* ]] && source /usr/local/share/liquidprompt
fi
