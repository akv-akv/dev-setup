# macOS Development Environment Setup

## Overview
This repository provides an automated setup on MacOS for software development purposes. It includes system utilities, development tools, cloud CLI tools, dotfile management and basic apps.

## Features
- **Homebrew for global tools**: System utilities, CLI tools, Kubernetes, and containers.
- **Devbox for project-specific dependencies**: Python, Node.js, and cloud tools.
- **macOS system configurations**: Customize Finder, Dock, and keyboard settings.
- **Dotfile management**: `.zshrc`, `vimrc`, and `nushell_config.nu`.

## Installation

### 1. Clone the Repository

If `git` is not installed yet:
```sh
cd ~
mkdir -p ~/.dev-setup ~/.dev-setup-temp
curl -L -o repo.zip https://github.com/akv-akv/dev-setup/archive/refs/heads/master.zip
unzip repo.zip -d ~/.dev-setup-temp/
mv ~/.dev-setup-temp/dev-setup-master/* ~/.dev-setup/
rm -rf ~/.dev-setup-temp/
rm repo.zip
cd ~/.dev-setup
```

Otherwise just clone repo using git:
```sh
cd ~
git clone https://github.com/akv-akv/dev-setup.git ./.dev-setup
```

### 2. Run the Setup Script
```sh
./install.sh
```
This will provide a set of installation options:
- Install **Xcode Command Line Tools**
- Install **Homebrew** and all packages from `Brewfile`
- Install **Devbox** for project-specific environments
- Change some of **macOS default system settings**
- Symlink dotfiles for `vim`, `zsh` etc.

## Devbox Setup
### Initialize Devbox in a Project
```sh
devbox init
```
### Add Project Dependencies
```sh
devbox add python@3.11 poetry
```
### Enter Devbox Shell
```sh
devbox shell
```

## Maintenance
- **Update Homebrew & Devbox**:
  ```sh
  brew update && brew upgrade
  devbox update
  ```
- **Clean Up Unused Packages**:
  ```sh
  brew cleanup
  ```

## Contributing
Feel free to submit pull requests or create issues to improve this setup.
