#
# Defines environment variables.
#

export FPATH=~/.zfunctions:$FPATH

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# use vim as the visual editor
export VISUAL=nvim
export EDITOR=$VISUAL
export TERM="xterm-256color"

# ensure dotfiles bin directory is loaded first
# if [[ -z $TMUX ]]; then
  # export PATH="$HOME/.bin:$PATH"
  # export PATH=".git/safe/../../bin:$PATH"
  # export PATH=$PATH:/usr/local/opt/go/libexec/bin
# fi

# # load rbenv if available
if which rbenv &>/dev/null ; then
  eval "$(rbenv init - zsh --no-rehash)"
fi

# Local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
source ~/.zalias

# docker
# eval $(docker-machine env default)
