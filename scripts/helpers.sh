#!/bin/bash

e_message() {
  printf "\n✨  %s\n\n" "$@"
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

[[ $OSTYPE == darwin* ]] || { e_failure "Unsupported operating system (macOS only)"; exit 1; }

