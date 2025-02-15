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
    
    # Nvim config
    ln -s ~/.dev-setup/dotfiles/nvim ~/.config/nvim

    # Java
    sudo ln -sfn /opt/homebrew/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk
    sudo ln -sfn /opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk

}   
