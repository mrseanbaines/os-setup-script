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

# Install Oh My Zsh plugins (skip if already installed)
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

# Download dotfiles
# Preserve anything between # BEGIN CUSTOM / # END CUSTOM
ZSHRC="$HOME/.zshrc"
CUSTOM_CONTENT=""
if [[ -f "$ZSHRC" ]]; then
  CUSTOM_CONTENT=$(awk '/^# BEGIN CUSTOM$/{found=1; next} /^# END CUSTOM$/{found=0; next} found{print}' "$ZSHRC")
fi

curl -fsSL https://raw.githubusercontent.com/mrseanbaines/dotfiles/master/.zshrc -o "$ZSHRC"

# Strip any pre-existing custom block from the downloaded file, then re-append
sed -i '' '/^# BEGIN CUSTOM$/,/^# END CUSTOM$/d' "$ZSHRC"
printf '\n# BEGIN CUSTOM\n%s\n# END CUSTOM\n' "$CUSTOM_CONTENT" >> "$ZSHRC"

curl -fsSL https://raw.githubusercontent.com/mrseanbaines/dotfiles/master/.gitconfig -o ~/.gitconfig
curl -fsSL https://raw.githubusercontent.com/mrseanbaines/dotfiles/master/.gitignore_global -o ~/.gitignore_global
curl -fsSL https://raw.githubusercontent.com/mrseanbaines/dotfiles/master/.zprofile -o ~/.zprofile

echo "Shell configuration complete! 🎉"
