#!/usr/bin/env bash

echo "Starting setup..."

# Configure MacBook preferences
source mac-os.sh

# Install Homebrew, update everything, install formulae & casks etc.
source homebrew.sh

# Install latest Node and set as default
nvm install --lts
nvm alias default 'lts/*'

echo "MacBook setup complete! 🎉"
