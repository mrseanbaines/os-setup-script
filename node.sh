#!/usr/bin/env bash

echo "Running Node steps..."

# Ensure Homebrew binaries are in PATH (n is installed via Homebrew)
if [[ -f /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -f /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# Install latest LTS Node
n lts

echo "Node steps complete! 🎉"
