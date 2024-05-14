# clean up
rm -rf ~/.local/nvim
rm -rf ~/.local/tmux
rm -rf ~/.config/nvim
rm -rf ~/.config/tmux

# tmux package manager installation
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# create tmux config directory and copy base config file
mkdir -p ~/.config/tmux
cp ./tmux.conf ~/.config/tmux/tmux.conf

# create nvim config directory and copy base config files
mkdir -p ~/.config/nvim
cp -r ./nvim ~/.config/nvim

# copy fonts to local machine for mac
if [[ `uname` == "Darwin" ]]; then
  cp -rf ./fonts/*.ttf ~/Library/Fonts
fi
