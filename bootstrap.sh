#!/usr/bin/env bash

# Setup script for setting up a new macOS machine

echo "Starting setup..."

# echo "Installing Xcode command line tools..."

# Install Xcode command line tools
# FIXME: Get rid of this (if e.g. Homebrew installs it already)?
# xcode-select --install

# Configure MacBook preferences
source mac-os.sh

# Install Homebrew, update everything, install formulae & casks etc.
source homebrew.sh

# Install Node
# FIXME: This doesn't seem to work. Work out how best to install Node
# nvm install --lts

echo "MacBook setup complete! 🎉"
