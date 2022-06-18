#!/usr/bin/env bash

echo "Starting setup..."

# Configure MacBook preferences
source mac-os.sh

# Install Homebrew, update everything, install formulae & casks etc.
source homebrew.sh

# Install Node
# FIXME: This doesn't seem to work. Work out how best to install Node
# nvm install --lts

echo "MacBook setup complete! 🎉"
