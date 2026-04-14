#!/usr/bin/env bash

echo "Running Node steps..."

# Install Node to a user-owned directory to avoid requiring sudo
export N_PREFIX="$HOME/.n"
export PATH="$N_PREFIX/bin:$PATH"

# Persist N_PREFIX and PATH for future shell sessions
echo 'export N_PREFIX="$HOME/.n"' >> ~/.zshrc
echo 'export PATH="$N_PREFIX/bin:$PATH"' >> ~/.zshrc

# Install latest LTS Node
n lts

echo "Node steps complete! 🎉"
