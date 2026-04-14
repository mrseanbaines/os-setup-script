#!/usr/bin/env bash

echo "Configuring shell..."

# Set zsh as the default shell
chsh -s $(which zsh)

# Install Oh My Zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Shell configuration complete! 🎉"
