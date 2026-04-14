#!/usr/bin/env bash

echo "Running Node steps..."

# Install Node to a user-owned directory to avoid requiring sudo
export N_PREFIX="$HOME/.n"
export PATH="$N_PREFIX/bin:$PATH"

# Install latest LTS Node
n lts

echo "Node steps complete! 🎉"
