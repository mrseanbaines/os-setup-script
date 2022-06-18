#!/usr/bin/env bash

# Check for Homebrew to be present, install if it's missing
if test ! $(which brew); then
  # Install Homebrew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Packages to install
FORMULAE=(
  git
  nvm
  yarn
)

# Install Homebrew formulae
brew install ${FORMULAE[@]}

# Applications to install
CASKS=(
  1password
  # authy
  # figma
  # firefox
  # gifox
  # google-chrome
  # insomnia
  # iterm2
  # linear-linear
  # notion
  # raycast
  # sketch
  # slack
  spotify
  # tableplus
  # visual-studio-code
  # zoom
)

# Install Homebrew casks
brew install ${CASKS[@]} --cask

# Remove outdated versions from the cellar
brew cleanup
