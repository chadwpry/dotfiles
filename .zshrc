autoload -Uz vcs_info

precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%F{green}%*%f %F{cyan}%n@%m %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '

alias pytest="python3 -m pytest -o markers=task"

export EDITOR='nvim'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

if [ -f $HOME/.cargo/env ]; then
  . "$HOME/.cargo/env"
fi

export PATH=/usr/local/bin:$PATH:$HOME/go/bin

if [[ $OSTYPE == 'linux-gnu']]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

