#!/bin/bash

e_message() {
  printf "\n✨  %s\n" "$@"
}

e_status() {
  printf "%s\n" "$@"
}

e_failure() { e_status "🔴  $1"; }
e_pending() { e_status "⏳  $1..."; }
e_success() { e_status "🟢  $1"; }

has_command() { command -v "$1" &>/dev/null; }
test_status() { has_command "$1" && e_success "$1" || e_failure "$1"; }

has_brew() { brew list --versions "$1" &>/dev/null; }
has_cask() { brew list --cask "$1" &>/dev/null; }

has_path() { [[ -e "$HOME/$1" ]]; }

has_app() { [[ -e "/Applications/$1.app" ]]; }

test_item() {
  local type_check="$1"
  local name="$2"
  "$type_check" "$name" && e_success "$name" || e_failure "$name"
}

has_arm() { [[ $(uname -p) == "arm" ]]; }

has_consent() { [[ "$REPLY" =~ ^[Yy]$ ]]; }

get_consent() {
  printf "❔  %s? [y/n]: " "$@"
  read -r -n 1 REPLY
  printf "\n"
}

install_if_missing() {
  local cmd="$1"      # The command to check (e.g., brew, xcode-select)
  local install_cmd="$2"  # The installation command
  local description="$3"  # Human-readable description of the tool

  if has_command "$cmd"; then
    e_success "$description already installed."
  else
    e_pending "Installing $description..."
    eval "$install_cmd"  # Run the provided installation command
    e_success "$description installed."
  fi
}

install_if_exists() {
  local cmd="$1"      # The command to check (e.g., brew, xcode-select)
  local install_cmd="$2"  # The installation command
  local description="$3"  # Human-readable description of the tool

  if has_command "$cmd"; then
    e_pending "Installing tools depending on $description..."
    echo "$install_cmd"
    eval "$install_cmd"  # Run the provided installation command
    e_success "Installed tools depending on $description."
  else
    e_failure "$description is not installed yet."
  fi
}

[[ $OSTYPE == darwin* ]] || { e_failure "Unsupported operating system (macOS only)"; exit 1; }

