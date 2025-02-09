apply_dotfiles_and_settings() {
	rm -rf ~/.dev-setup/
	mkdir -p ~/.dev-setup ~/.dev-setup-temp
	curl -L -o repo.zip https://github.com/akv-akv/dev-setup/archive/refs/heads/master.zip
	unzip repo.zip -d ~/.dev-setup-temp/
	mv ~/.dev-setup-temp/dev-setup-master/* ~/.dev-setup/
	rm -rf ~/.dev-setup-temp/
	rm repo.zip

    # Vim    
    install_if_exists \
        "vim" \
        "$(cat ./scripts/tools/vim.sh)" \
        "Vim"

    # Zsh
    install_if_exists \
        "zsh" \
        "$(cat ./scripts/tools/zsh.sh)" \
        "Zsh"
}   
