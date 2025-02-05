source helpers.sh

show_menu() {
  echo "\nMacOS Setup Script"
  echo "0) Exit"
  echo "1) Adjust macOS Settings"
  echo "2) XCode Developer Tools"
  echo "3) Homebrew"
  echo "Select an option:"
  read -r choice
}

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
  
  e_message "Disabling natural scrolling"
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

install_xcode_tools() {
  if has_command "xcode-select"; then
    e_success "Xcode Command Line Tools already installed."
  else
    e_pending "Installing Xcode Command Line Tools"
    xcode-select --install
    e_success "Xcode Command Line Tools installed."
  fi
}

install_homebrew() {
  if has_command "brew"; then
    e_success "Homebrew already installed."
  else
    e_pending "Installing Homebrew"
    sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
    e_success "Homebrew installed."
  fi
}

while true; do
  show_menu
  case $choice in
	  0) break;;
	  1) adjust_macos_settings;;
    2) install_xcode_tools;;
    3) install_homebrew;;
	  *) e_failure "Invalid option. Please try again.";;
  esac
done

