#!/usr/bin/env bash

echo "Running Node steps..."

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

# Source nvm into the current session (the installer only adds it to shell config files)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install latest Node and set as default
nvm install --lts
nvm alias default 'lts/*'

echo "Node steps complete! 🎉"
