ln -s ~/.dev-setup/dotfiles/vimrc ~/.vimrc
rm -rf ~/.vim/bundle/Vundle.vim
git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim  
vim +PluginInstall +qall