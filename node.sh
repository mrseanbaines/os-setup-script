echo "Running Node steps..."

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

# Install latest Node and set as default
nvm install --lts
nvm alias default 'lts/*'

echo "Node steps complete! 🎉"
