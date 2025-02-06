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

install_apps_using_homebrew() {
  if has_command "brew"; then
    e_pending "Installing Apps Using Homebrew"
    brew bundle --file ./scripts/Brewfile --no-upgrade
    e_success "Apps installed."
  else
    e_failure "Install Homebrew first"
  fi
}

