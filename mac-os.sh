#!/usr/bin/env bash

echo "Configuring MacBook preferences..."

# Close any open System Preferences panes to prevent them from overriding settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

################################################################################
# region - General UI/UX                                                       #
################################################################################

# Set dark theme
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

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
# region - Finder                                                              #
################################################################################

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# endregion

################################################################################
# region - Trackpad, mouse, keyboard, Bluetooth accessories, and input         #
################################################################################

# Trackpad: disable tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool false
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool false

# Trackpad: disable double-tap to zoom
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerDoubleTapGesture -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerDoubleTapGesture -int 0

# Disable swipe between pages
defaults write d AppleEnableSwipeNavigateWithScrolls -bool false
defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool false

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

# Enable dock icon magnification
defaults write com.apple.dock magnification -bool true

# Set the default icon size of Dock items to 32 pixels
defaults write com.apple.dock tilesize -int 32

# Set the magnified icon size of Dock items to 48 pixels
defaults write com.apple.dock largesize -int 48

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Set faster Dock hiding time
defaults write com.apple.dock autohide-time-modifier -float 0.5

# Turn off all hot corners
defaults write com.apple.dock wvous-tl-corner -int 1
defaults write com.apple.dock wvous-tr-corner -int 1
defaults write com.apple.dock wvous-bl-corner -int 1
defaults write com.apple.dock wvous-br-corner -int 1

# endregion

echo "MacBook preferences configured! 🎉"
