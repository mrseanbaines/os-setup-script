#!/usr/bin/env bash

echo "Configuring shell..."

# Set zsh as the default shell
chsh -s $(which zsh)

# Install Oh My Zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Download .zshrc from dotfiles repo (overwrites the Oh My Zsh template)
curl -fsSL https://raw.githubusercontent.com/mrseanbaines/dotfiles/master/.zshrc -o ~/.zshrc

# Append n (Node version manager) config
echo 'export N_PREFIX="$HOME/.n"' >> ~/.zshrc
echo 'export PATH="$N_PREFIX/bin:$PATH"' >> ~/.zshrc

echo "Shell configuration complete! 🎉"
