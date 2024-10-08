# .bash_aliases.  Not just for aliases anymore.

[ -z "$PS1" ] && return

# Random stuff
export HISTIGNORE="&:ls:exit"
export EDITOR="/usr/bin/vim"

# Override the terrible bold+blue for directories
# on a black background.  Blue is s/33/34/
export LS_COLORS="di=01;33"

alias ls='ls --color=auto'
alias la='ls -lathr'

# Aliases
alias grep="grep --color"
alias rmpyc="find . -name '*pyc' -exec rm {} \;"

alias k='kubectl'
alias fgk='flux get kustomizations'

if [ -d ~/bin ]; then
    export PATH="~/bin:$PATH"
fi

if [ -d ~/node_modules/.bin ]; then
    export PATH="~/node_modules/.bin:$PATH"
fi

# virtualenv stuff
if [ -f ~/.virtualenvwrapper ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    source $HOME/.virtualenvwrapper
fi

if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi
