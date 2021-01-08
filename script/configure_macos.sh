#!/usr/bin/env bash

set -e

# Close any open System Preferences panes, to prevent them from overriding
# settings we're about to change
osascript -e 'tell application "System Preferences" to quit'

# System Preferences > General > Appearance: Dark
defaults write -globalDomain AppleInterfaceStyle -string "Dark"

# System Preferences > General > Accent Colour: Graphite
defaults write -globalDomain AppleAccentColor -int -1
defaults write -globalDomain AppleAquaColorVariant -int 6
defaults write -globalDomain -string "0.847059 0.847059 0.862745 Graphite"

# System Preferences > General > Show scroll bars: When scrolling
defaults write -globalDomain AppleShowScrollBars -string "WhenScrolling"

# System Preferences > Dock > Minimize windows into application icon
defaults write com.apple.dock minimize-to-application -bool true

# System Preferences > Dock > Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# System Preferences > Dock > Show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# System Preferences > Mission Control > Automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# System Preferences > Language & Region > Time format: 24-hour Time
defaults write -globalDomain AppleICUForce24HourTime -bool true
defaults write com.apple.menuextra.clock DateFormat -string "EEE MMM d  HH:mm"

# Keyboard > Enable key repeat
defaults write -globalDomain ApplePressAndHoldEnabled -bool false

# System Preferences > Keyboard > Keyboard > Key Repeat
defaults write -globalDomain KeyRepeat -int 2

# System Preferences > Keyboard > Keyboard > Delay Until Repeat
defaults write -globalDomain InitialKeyRepeat -int 24

# System Preferences > Keyboard > Text > Correct spelling automatically
defaults write -globalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# System Preferences > Keyboard > Text > Capitalize words automatically
defaults write -globalDomain NSAutomaticCapitalizationEnabled -bool false

# System Preferences > Keyboard > Text > Use smart quotes and dashes
defaults write -globalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -globalDomain NSAutomaticDashSubstitutionEnabled -bool false

# System Preferences > Keyboard > Keyboard Shortcuts > Use keyboard navigation to move focus between controls
defaults write -globalDomain AppleKeyboardUIMode -int 2

# System Preferences > Keyboard > Input Sources > Live Conversion
defaults write com.apple.inputmethod.Kotoeri JIMPrefLiveConversionKey -bool false

# System Preferences > Keyboard > Input Sources > Yen key generates
defaults write com.apple.inputmethod.Kotoeri JIMPrefCharacterForYenKey -int 1

# System Preferences > Keyboard > Input Sources > Full-width numeral characters
defaults write com.apple.inputmethod.Kotoeri JIMPrefFullWidthNumeralCharactersKey -bool false

# System Preferences > Trackpad > Point & Click > Tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# System Preferences > Trackpad > Point & Click > Tracking speed
defaults write -globalDomain com.apple.trackpad.scaling -float 0.875

# Battery > Show Percentage
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Finder > Preferences > General > Show these items on the desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false

# Finder > Preferences > Sidebar > Show these items in the sidebar
defaults write com.apple.finder ShowRecentTags -bool false

# Finder > Preferences > Advanced > Show all filename extensions
defaults write -globalDomain AppleShowAllExtensions -bool true

# Finder > Preferences > Advanced > Show warning before changing an extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Finder > Preferred view style
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Expand save panel by default
defaults write -globalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write -globalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write -globalDomain PMPrintingExpandedStateForPrint -bool true
defaults write -globalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
defaults write -globalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Clear dock items
defaults write com.apple.dock persistent-apps -array

# Restart affected apps
for app in "Dock" "Finder"; do
  killall "${app}" > /dev/null 2>&1
done
