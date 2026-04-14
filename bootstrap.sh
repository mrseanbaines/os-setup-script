#!/usr/bin/env bash

echo "Starting setup..."

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

# Install Homebrew, update everything, install formulae & casks etc.
# source homebrew.sh

# Install Node
source node.sh

# Configure MacBook preferences
source mac-os.sh

# Configure shell and preferences
source shell.sh

echo "MacBook setup complete! 🎉"

# Load the new shell config into the current session
source ~/.zshrc
