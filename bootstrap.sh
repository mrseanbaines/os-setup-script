#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

# Ensure Homebrew is available (needed to install gum)
if ! command -v brew &>/dev/null; then
  if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -f /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
fi

# Install gum for interactive menus if not already present
if ! command -v gum &>/dev/null; then
  brew install gum
fi

# Prompt for which steps to run (all pre-selected by default)
CHOICES=$(gum choose --no-limit \
  --header="Which steps would you like to run?" \
  --selected="Homebrew,Node,macOS preferences,Shell" \
  "Homebrew" \
  "Node" \
  "macOS preferences" \
  "Shell")

echo "$CHOICES" | grep -q "^Homebrew$"          && gum spin --spinner dot --title "Running Homebrew..."  -- bash homebrew.sh
echo "$CHOICES" | grep -q "^Node$"              && gum spin --spinner dot --title "Installing Node..."   -- bash node.sh
echo "$CHOICES" | grep -q "^macOS preferences$" && gum spin --spinner dot --title "Configuring macOS..." -- bash mac-os.sh
echo "$CHOICES" | grep -q "^Shell$"             && gum spin --spinner dot --title "Configuring shell..." -- bash shell.sh

gum log --level info "MacBook setup complete!"

# Load the new shell config into the current session
source ~/.zshrc
