# Changin default shell
chsh -s $(which zsh)
# Oh-My-Zsh
rm -rf ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm ~/.zshrc
ln -s ~/.dev-setup/dotfiles/zshrc ~/.zshrc