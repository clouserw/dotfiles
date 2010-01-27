# .bash_aliases.  Not just for aliases anymore.

[ -z "$PS1" ] && return

# Random stuff
export HISTIGNORE="&:ls:exit"
export EDITOR="/usr/bin/vim"

# Aliases
alias grep="grep --color"
alias rmpyc="find . -name '*pyc' -exec rm {} \;"

# virtualenv stuff
export WORKON_HOME=$HOME/.virtualenvs
source $HOME/.virtualenvwrapper

if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi
