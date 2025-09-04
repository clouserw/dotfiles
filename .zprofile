# Runs for login shells


# --- Paths ---
[[ -d /usr/local/bin ]] && export PATH="/usr/local/bin:$PATH"
[[ -d $HOME/bin ]] && export PATH="$HOME/bin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"

# --- Tools ---
export NVM_DIR="$HOME/.nvm"

# --- Misc ---
export CLICOLOR=1
export DISPLAY=":0"
