#!/usr/bin/env bash

# Setup script for setting up a new macOS machine

echo "Starting setup"

# Install Xcode CLI
xcode-select --install

# Check for Homebrew to be present, install if it's missing
if test ! $(which brew); then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# PACKAGES=(
#   # List all the packages you want to install
# )

# echo "Installing packages..."

# # Install Homebrew packages
# brew install ${PACKAGES[@]}

# Any additional steps you want to add here

echo "Cleaning up..."

# Uninstall old versions of formulas
brew cleanup

# echo "Installing cask..."

# CASKS=(
#   # List all the applications you want to install
# )

# echo "Installing cask apps..."

# brew install ${CASKS[@]} --cask

# Set fast key repeat rate
# defaults write NSGlobalDomain KeyRepeat -int 0

echo "MacBook setup complete! 🎉"
