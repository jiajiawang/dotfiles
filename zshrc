# Executes commands at the start of an interactive session.

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export RUBYMOTION_ANDROID_NDK="${ZDOTDIR:-$HOME}/.rubymotion-android/ndk"
export RUBYMOTION_ANDROID_SDK="${ZDOTDIR:-$HOME}/.rubymotion-android/sdk"

fpath=(/Users/JJ/.zsh/completion $fpath)

# Load nvm
export NVM_DIR=~/.nvm
. $(brew --prefix nvm)/nvm.sh
