echo "Copying over VIM configuration..."
if [ ! -f ~/.vim/bundle/Vundle.vim/README.md ]; then
        echo "Vundle not found. Installing from https://github.com/VundleVim/Vundle.vim.git"
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	cp ~/dotfiles/vim-config/.vimrc ~/.vimrc
        vim +PluginInstall +qall
else
	echo "Vundle found. Copying .vimrc from repo to home directory..."
	cp ~/dotfiles/vim-config/.vimrc ~/.vimrc
        vim +PluginInstall +qall
fi
