# clean up
rm -rf ~/.local/share/nvim
echo removed nvim from $XDG_CONFIG_HOME/.local/share

rm -rf ~/.local/state/nvim
echo removed nvim state from $XDG_CONFIG_HOME/.local/state

rm -rf ~/.local/share/tmux
echo removed tmux from $XDG_CONFIG_HOME/.local/share

rm -rf ~/.local/state/tmux
echo removed tmux state from $XDG_CONFIG_HOME/.local/state

rm -rf ~/.local/share/vim-lsp-settings
echo removed vim-lsp-settings from $XDG_CONFIG_HOME/.local/share

unlink ~/.config/nvim
echo removed nvim link from $XDG_CONFIG_HOME

unlink ~/.config/tmux
echo removed tmux link from $XDG_CONFIG_HOME

rm -rf ~/.tmux
echo removed .tmux directory from $HOME

rm $HOME/.zshrc
echo removed zsh configuration link from $HOME

rm $HOME/.gitconfig
echo removed git configuration link from $HOME

# tmux package manager installation
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo cloned tmux package manager to user .tmux directory

# create ~/.config if it doesn't exist already
mkdir -p ~/.config

# link tmux config directory to ~/.config/tmux ($XDG_CONFIG_HOME)
ln -s $HOME/dotfiles/tmux $HOME/.config/tmux
echo linked tmux configuration to $XDG_CONFIG_HOME

# link nvim config directory to ~/.config/nvim
ln -s $HOME/dotfiles/nvim $HOME/.config/nvim
echo linked nvim configuration to $XDG_CONFIG_HOME

# copy fonts to local machine for mac
if [[ $OSTYPE == 'darwin'* ]]; then
  cp -rf $HOME/dotfiles/fonts/*.ttf ~/Library/Fonts
  echo copied fonts on mac system
fi

# link git configuration
ln -s $HOME/dotfiles/git/.gitconfig $HOME
echo linked git configuration to $HOME

# link zsh configuration
ln -s $HOME/dotfiles/.zshrc $HOME
echo linked zsh configuration to $HOME
