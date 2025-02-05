source helpers.sh

show_menu() {
  echo "\nMacOS Setup Script"
  echo "0) Exit"
  echo "1) Adjust macOS Settings"
  echo "Select an option:"
  read -r choice
}

adjust_macos_settings() {
  e_pending "Adjusting macOS settings"
  
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
  e_message "Disabling press-and-hold for keys"
  defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
  
  e_message "Increasing key repeat speed"
  defaults write NSGlobalDomain KeyRepeat -int 1
  
  e_message "Decreasing delay before key repeat"
  defaults write NSGlobalDomain InitialKeyRepeat -int 10
  
  # Trackpad & Mouse
  e_message "Enabling tap to click"
  defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
  
  e_message "Disabling natural scrolling"
  defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true
  
  # Terminal & Shell
  e_message "Setting screenshot save location to ~/Screenshots"
  defaults write com.apple.screencapture location -string "~/Screenshots"
  killall SystemUIServer
  
  # Security & Privacy
  e_message "Preventing .DS_Store files on network volumes"
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
  
  e_success "macOS settings adjusted."
}

while true; do
  show_menu
  case $choice in
	  0) break;;
	  1) adjust_macos_settings;;
	  *) e_failure "Invalid option. Please try again.";;
  esac
done

