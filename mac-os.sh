echo "Configuring MacBook preferences..."

################################################################################
# region - General UI/UX                                                       #
################################################################################

# Set sidebar icon size to medium
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1

# Only show scrollbars when scrolling
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"
# Possible values: `WhenScrolling`, `Automatic` and `Always`

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# endregion

################################################################################
# region - Trackpad, mouse, keyboard, Bluetooth accessories, and input         #
################################################################################

# Trackpad: disable tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool false

# Disable “natural” scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Set mouse tracking speed
defaults write NSGlobalDomain com.apple.mouse.scaling -float 2.5

# Set trackpad tracking speed
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 3

# Set keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# endregion

################################################################################
# region - Dock, Dashboard, and hot corners                                    #
################################################################################

# Set the default icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36

# Set the magnified icon size of Dock items to 48 pixels
defaults write com.apple.dock largesize -int 48

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# endregion

echo "MacBook preferences configured! 🎉"
