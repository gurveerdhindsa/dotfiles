#!/bin/bash

set -e

# Define install location
LOC=$HOME/dotfiles

success () {
  printf "\\033[32m PASS \\033[0m\\n"
}

fail () {
  printf "\\n\\033[31m FAIL \\033[0m $1\\n"
  exit 1
}

echo () {
  printf "\\033[33m ➜ \\033[0m $1"
}


# Find macos
echo "Checking system..."
if [[ $(uname) != 'Darwin' ]]; then
  fail "You are not on a mac."
else
  success
fi

# install homebrew if missing
if [[ ! -x "$(command -v brew)" ]]; then
  echo "Installing homebrew...\\n"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew is already installed.\\n"
fi

# Dots already exist
echo "Looking for dotfiles..."
if [[ -d  $LOC ]]; then
  fail "Dots already exist."
else
  success
fi

# Create dotfiles directory and clone
echo "Cloning dotfiles..."
[[ ! -d "$HOME" ]] && mkdir -p "$HOME/dotfiles"
git clone -q https://github.com/gurveerdhindsa/dotfiles.git "$LOC"
success

# Link files
echo "Linking Files..."
for file in zshrc gitconfig gitignore
do
  rm ~/.$file &>/dev/null
  ln -s "$DOTLOC/$file" ~/.$file
done
success

# Change default shell
chsh -s zsh

# Reload
exec zsh



