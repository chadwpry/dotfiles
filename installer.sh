# clean up
rm -rf ~/.local/nvim
rm -rf ~/.local/tmux
rm -rf ~/.config/nvim
rm -rf ~/.config/tmux
rm -rf ~/.tmux
echo removed old nvim and tmux .config, .local, and .tmux directories

# tmux package manager installation
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo cloned tmux package manager to user .tmux directory

# create tmux config directory and copy base config file
mkdir -p ~/.config/tmux
cp ./tmux.conf ~/.config/tmux/tmux.conf
echo copied tmux configuration

# create nvim config directory and copy base config files
mkdir -p ~/.config/nvim
cp -r ./nvim ~/.config
echo copied nvim configuration

# copy fonts to local machine for mac
if [[ $OSTYPE == 'darwin'* ]]; then
  cp -rf ./fonts/*.ttf ~/Library/Fonts
  echo copied fonts on mac system
fi

# copy git configuration
cp ./git/.gitconfig $HOME
echo copied gitconfig
