# Runs for all shells, after .zprofile

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_IGNORE_SPACE  # Don't save when prefixed with space
setopt HIST_IGNORE_DUPS   # Don't save duplicate lines
setopt NOAUTOMENU # Just show a list when I hit tab

alias rsync='noglob rsync'
alias scp='noglob scp'
alias vi="nvim"
alias vim="nvim"
alias vd="nvim -d"
alias vimdiff="nvim -d"
alias fgk="flux get kustomizations"
alias k="kubectl"
alias ls='ls -G'
alias ll='ls -lG'
alias disablehistory="function zshaddhistory() {  return 1 }"
alias enablehistory="unset -f zshaddhistory"

export EDITOR="nvim"
export GPG_TTY=$TTY

autoload -Uz compinit
compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.zcompdump"

# --- PROMPT ---
#
# Let zsh run ${...} inside PROMPT
setopt PROMPT_SUBST

# Stop Python's activate from adding its own (venv) prefix
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Show "(parentdir)" only when a venv is active
# ${VIRTUAL_ENV:+...} => expand the ... only if VIRTUAL_ENV is set
# $VIRTUAL_ENV:h     => head (dirname)
# :t                 => tail (basename)
export PS1='%F{green}%n@%m%f:%F{red}%0~%f${VIRTUAL_ENV:+($VIRTUAL_ENV:h:t)} %# '


# --- Tools ---
#
#
# only in interactive shells, and only if atuin exists
[[ -o interactive ]] && (( $+commands[atuin] )) && eval "$(atuin init zsh --disable-up-arrow)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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


# Completion
if (( ${+commands[direnv]} )); then emulate zsh -c "$(direnv hook zsh)"; fi
if (( ${+commands[flux]} )); then source <(flux completion zsh); fi


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc'; fi

export NVM_DIR="$HOME/.nvm"
source "$(brew --prefix nvm)/nvm.sh"

# Source anything private.  Note that .zlogin would still run after this
[[ ! -f ~/.privaterc ]] || source ~/.privaterc

