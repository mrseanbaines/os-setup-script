#!/usr/bin/env bash

echo "Configuring shell..."

# Set zsh as the default shell
chsh -s /bin/zsh

# Reload the shell to start using zsh
exec /bin/zsh

# Install Oh My Zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Shell configuration complete! 🎉"
