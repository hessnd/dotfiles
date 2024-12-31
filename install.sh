set -e

# Change shell to zsh
chsh -s "$(which zsh)"

echo -n "remove default files..."
rm "$HOME/.zshrc"

echo -n "SymLinking dotfiles..."
ln -s "$HOME/dotfiles/zshrc" "$HOME/.zshrc"
ln -s "$HOME/dotfiles/tmux" "$HOME/.config/tmux"
ln -s "$HOME/dotfiles/lazygit" "$HOME/.config/lazygit"
ln -s "$HOME/dotfiles/nvim-lazy" "$HOME/.config/nvim"

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
