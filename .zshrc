


export CLICOLOR=1
export LS_COLORS="di=01;33"

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_IGNORE_SPACE  # Don't save when prefixed with space
setopt HIST_IGNORE_DUPS   # Don't save duplicate lines
setopt SHARE_HISTORY      # Share history between sessions

if [ -d $HOME/bin ]; then
    export PATH="$HOME/bin:$PATH"
fi
