source ./scripts/helpers.sh
source ./scripts/macos_settings.sh
source ./scripts/base.sh

show_menu() {
  echo "\nMacOS Setup Script"
  echo "0) Exit"
  echo "1) Adjust macOS Settings"
  echo "2) XCode Developer Tools"
  echo "3) Homebrew"
  echo "4) Install apps using Homebrew"
  echo "Select an option:"
  read -r choice
}

while true; do
  show_menu
  case $choice in
	0) break;;
	1) adjust_macos_settings;;
    2) install_xcode_tools;;
    3) install_homebrew;;
    4) install_apps_using_homebrew;;
	*) e_failure "Invalid option. Please try again.";;
  esac
done