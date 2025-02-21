echo "Copying over VIM configuration..."
if [ ! -f ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
cp ~/dotfiles/vim-config/.vimrc ~/.vimrc
vim +PluginInstall +qall
