apply_dotfiles_and_settings() {
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
