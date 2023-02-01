set -e

# Change shell to zsh
chsh -s $(which zsh)

echo -n "remove default files..."
rm $HOME/.vimrc
rm $HOME/.zshrc
rm $HOME/.gitconfig

echo -n "SymLinking dotfiles..."
#Symlink .zshrc and .vimrc
ln -s $HOME/dotfiles/vimrc $HOME/.vimrc

#mkdir $HOME/.vim/
ln -s $HOME/dotfiles/zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/git/gitconfig $HOME/.gitconfig

echo -n "Setting italics in vim"
tic xterm-256color-italic.terminfo
echo 'done!'

#Brew specific installs
brew install git
brew install node
brew install neovim
brew install treesitter
brew install lua
brew install lua-language-server

# NPM installs
npm install -g @fsouza/prettierd
npm install -g eslint_d
npm install -g typescript-language-server

