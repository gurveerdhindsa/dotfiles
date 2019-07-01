# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/gurveerdhindsa/.oh-my-zsh"

# ZSH_THEME="spaceship"

autoload -U promptinit; promptinit
prompt pure

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $HOME/.aliases
source $ZSH/oh-my-zsh.sh


# Default vim

export VISUAL=/usr/local/bin/nvim
export EDITOR=$VISUAL

