DISABLE_MAGIC_FUNCTIONS=true

# Fast completion cache initialization
autoload -Uz compinit 
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# Path to your dotfiles.
export DOTFILES=$HOME/.dotfiles

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Theme configuration
ZSH_THEME="robbyrussell"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$DOTFILES

# Plugins
plugins=(
  git
  ssh-agent
  z
  gh
  docker
  docker-compose
)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# User configuration
export DOCKER_BUILDKIT=1

# Language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Editor configuration
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='code'
fi

# Functions
source $DOTFILES/functions.zsh

# Load autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Path configurations
path=(
  /opt/homebrew/bin
  /opt/homebrew/opt/libpq/bin
  /opt/homebrew/opt/node@20/bin
  ~/.local/bin
  $path
)
export PATH

# Load direnv
eval "$(direnv hook zsh)"
export PATH="$(brew --prefix)/opt/curl/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/lib/ruby/gems/3.4.0/bin:$PATH"
