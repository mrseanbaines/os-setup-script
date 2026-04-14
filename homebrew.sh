#!/usr/bin/env bash

echo "Running Homebrew steps..."

# Check for Homebrew to be present, install if it's missing
if test ! $(which brew); then
  # Install Homebrew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Load Homebrew into the current session (required on Apple Silicon where
# /opt/homebrew/bin is not in PATH by default)
if [[ -f /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -f /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Packages to install
FORMULAE=(
  displayplacer
  dockutil
  git
  n
  pnpm
  zsh
)

# Install Homebrew formulae
brew install "${FORMULAE[@]}"

# Applications to install
CASKS=(
  1password
  claude
  figma
  firefox
  gifox
  google-chrome
  insomnia
  linear-linear
  notion
  raycast
  slack
  spotify
  tableplus
  visual-studio-code
  warp
  zoom
)

# Install Homebrew casks (skip any already installed)
for cask in "${CASKS[@]}"; do
  if brew list --cask "$cask" &>/dev/null; then
    echo "Skipping $cask (already installed)"
  else
    brew install --cask "$cask"
  fi
done

# Remove outdated versions from the cellar
brew cleanup

echo "Homebrew steps complete! 🎉"
