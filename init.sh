#!/usr/bin/env bash

# Setup script for setting up a new macOS machine

echo "Starting setup..."

echo "Installing Xcode command line tools..."

# Install Xcode command line tools
xcode-select --install

# Check for Homebrew to be present, install if it's missing
if test ! $(which brew); then
  echo "Installing Homebrew..."

  # Install Homebrew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Updating packages..."

# Update Homebrew packages
brew update

PACKAGES=(
  # List all the packages you want to install
  git
  nvm
  yarn
)

echo "Installing packages..."

# Install Homebrew packages
brew install ${PACKAGES[@]}

# Install Node
nvm install --lts

echo "Cleaning up..."

# Uninstall old versions of formulas
brew cleanup

CASKS=(
  # List all the applications you want to install
  1password
  authy
  figma
  firefox
  gifox
  google-chrome
  insomnia
  iterm2
  linear-linear
  notion
  raycast
  sketch
  slack
  spotify
  tableplus
  visual-studio-code
  zoom
)

echo "Installing cask apps..."

# Install Homebrew casks
brew install ${CASKS[@]} --cask

# Configure MacBook preferences
./mac-os.sh

echo "MacBook setup complete! 🎉"
