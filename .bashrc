# Jeremy Stott (jeremy@stott.co.nz)

# Enable bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Enable shell compatibility for pipenv so it can show the active virtialenv
# https://github.com/kennethreitz/pipenv/issues/269
export PIPENV_SHELL_COMPAT=true

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
if [ -d $HOME/projects/dotfiles ]; then
    function dotfiles {
        /usr/local/bin/git --git-dir=$HOME/projects/dotfiles --work-tree=$HOME $@
    }
fi

# Only load Liquid Prompt in interactive shells, not from a script or from scp
if [ -f $HOME/projects/public/liquidprompt/liquidprompt ]; then
    [[ $- = *i* ]] && source $HOME/projects/public/liquidprompt/liquidprompt
fi
