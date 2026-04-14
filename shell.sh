#!/usr/bin/env bash

echo "Configuring shell..."

# Set zsh as the default shell (no-op on macOS Catalina+ where zsh is already the default)
if [[ "$SHELL" != */zsh ]]; then
  sudo chsh -s $(which zsh) $USER
fi

# Install Oh My Zsh (skip if already installed)
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Download dotfiles
curl -fsSL https://raw.githubusercontent.com/mrseanbaines/dotfiles/master/.zshrc -o ~/.zshrc
curl -fsSL https://raw.githubusercontent.com/mrseanbaines/dotfiles/master/.gitconfig -o ~/.gitconfig
curl -fsSL https://raw.githubusercontent.com/mrseanbaines/dotfiles/master/.gitignore_global -o ~/.gitignore_global

# Append n (Node version manager) config
echo 'export N_PREFIX="$HOME/.n"' >> ~/.zshrc
echo 'export PATH="$N_PREFIX/bin:$PATH"' >> ~/.zshrc

echo "Shell configuration complete! 🎉"
