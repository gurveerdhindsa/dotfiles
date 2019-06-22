#!/bin/sh

source ./scripts/cask.sh
source ./scripts/homebrew.sh
source ./scripts/symlinks.sh

echo "Sourcing .zshrc ..."
source "$HOME/.zshrc"
echo "Installation complete!"

sleep 5h # Waits 5 hours.
