alias pytest="python3 -m pytest -o markers=task"

export EDITOR='nvim'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

if [ -f $HOME/.cargo/env ]; then
  . "$HOME/.cargo/env"
fi

export PATH=/usr/local/bin:$PATH:$HOME/go/bin
