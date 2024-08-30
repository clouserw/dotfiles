# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi




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
export PATH="/usr/local/bin:$PATH"


alias rsync='noglob rsync'
alias scp='noglob scp'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PS1="%F{green}%n@%m%f:%F{red}%0~%f%# "

alias fgk="flux get kustomizations"
alias k="kubectl"
alias ls='ls -G'
alias ll='ls -lG'

export GPG_TTY=$(tty)

export DISPLAY=":0"

alias disablehistory="function zshaddhistory() {  return 1 }"
alias enablehistory="unset -f zshaddhistory"

export WORKON_HOME="$HOME/.virtualenvs"
export VIRTUALENVWRAPPER_PYTHON="/opt/homebrew/bin/python3"
export VIRTUALENVWRAPPER_VIRTUALENV="/opt/homebrew/bin/virtualenv"
#source /opt/homebrew/bin/virtualenvwrapper.sh

autoload -U add-zsh-hook
load-nvmrc() {
  [[ -a .nvmrc ]] || return
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh



# Completion

eval "$(direnv hook zsh)"

source <(flux completion zsh)

# Sourcing

[[ ! -f ~/.privaterc ]] || source ~/.privaterc

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
