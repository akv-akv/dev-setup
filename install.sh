source ./scripts/helpers.sh
source ./scripts/macos_settings.sh
source ./scripts/base.sh

show_menu() {
  echo "\nMacOS Setup Script"
  echo "0) Exit"
  echo "1) Run all commands"
  echo "2) Adjust macOS Settings"
  echo "3) XCode Developer Tools"
  echo "4) Homebrew"
  echo "5) Install apps using Homebrew"
  echo "Select an option:"
  read -r choice
}

run_all_commands() {
  adjust_macos_settings
  install_xcode_tools
  install_homebrew
  install_apps_using_homebrew
}

while true; do
  show_menu
  case $choice in
	  0) break;;
    1) run_all_commands;;
  	2) adjust_macos_settings;;
    3) install_xcode_tools;;
    4) install_homebrew;;
    5) install_apps_using_homebrew;;
	  *) e_failure "Invalid option. Please try again.";;
  esac
done