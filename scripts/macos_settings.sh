adjust_macos_settings() {
  e_pending "Adjusting macOS settings"

  # Creating necessary folders
  mkdir -p ~/Developer
  mkdir -p ~/Sandbox
  
  # Dock & Mission Control
  e_message "Enabling Dock auto-hide"
  defaults write com.apple.dock autohide -bool true
  
  e_message "Disabling Dock launch animation"
  defaults write com.apple.dock launchanim -bool false
  
  e_message "Reducing window resize animation time"
  defaults write NSGlobalDomain NSWindowResizeTime -float 0.1
  killall Dock
  
  # Finder & File Management
  e_message "Showing hidden files in Finder"
  defaults write com.apple.finder AppleShowAllFiles -bool true
  
  e_message "Showing all file extensions"
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true
  
  e_message "Setting Finder to list view by default"
  defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
  killall Finder
  
  # Keyboard & Input
  e_message "Increasing key repeat speed"
  defaults write NSGlobalDomain KeyRepeat -int 2
  
  e_message "Decreasing delay before key repeat"
  defaults write NSGlobalDomain InitialKeyRepeat -int 15
  
  # Trackpad & Mouse
  e_message "Enabling tap to click"
  defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
  
  e_message "Standard mac scrolling settings"
  defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true
  
  # Terminal & Shell
  e_message "Setting screenshot save location to ~/Documents/Screenshots"
  mkdir -p ~/Documents/Screenshots
  defaults write com.apple.screencapture location -string "~/Documents/Screenshots"
  killall SystemUIServer
  
  # Security & Privacy
  e_message "Preventing .DS_Store files on network volumes"
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
  
  e_success "macOS settings adjusted."
}