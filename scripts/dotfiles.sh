apply_dotfiles_and_settings() {
    # Vim
    e_pending "Applying Vim settings"
    ln -s ~/.dev-setup/dotfiles/vimrc ~/.vimrc
    rm -rf ~/.vim/bundle/Vundle.vim
    git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim  
    vim +PluginInstall +qall
    e_success "Vim settings applied"
}