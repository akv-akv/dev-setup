install_xcode_tools() {
  install_if_missing \
    "xcode-select" \
    "xcode-select --install" \
    "Xcode Command Line Tools"
}

install_homebrew() {
  install_if_missing \
    "brew" \
    "sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash" \
    "Homebrew"
}

install_devbox() {
  install_if_missing \
    "devbox" \
    "curl -fsSL https://get.jetify.com/devbox | bash" \
    "Devbox"
}

install_apps_using_homebrew() {
  if has_command "brew"; then
    e_pending "Installing Apps Using Homebrew"
    brew doctor
    brew upgrade
    brew bundle --file ./scripts/Brewfile --no-upgrade
    e_success "Apps installed."
  else
    e_failure "Install Homebrew first"
  fi
}
