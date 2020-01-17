# Executes commands at the start of an interactive session.

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

bindkey "^[f" forward-word

# Customize to your needs...
export RUBYMOTION_ANDROID_NDK="${ZDOTDIR:-$HOME}/.rubymotion-android/ndk"
export RUBYMOTION_ANDROID_SDK="${ZDOTDIR:-$HOME}/.rubymotion-android/sdk"
export ANDROID_HOME=/usr/local/opt/android-sdk

fpath=(/Users/JJ/.zsh/completion $fpath)

# set go path
export GOPATH=~/workspace/go
export PATH=$PATH:$GOPATH/bin

export VISUAL=nvim
export EDITOR=$VISUAL

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
_gen_fzf_default_opts() {
  local base03="234"
  local base02="235"
  local base01="240"
  local base00="241"
  local base0="244"
  local base1="245"
  local base2="254"
  local base3="230"
  local yellow="136"
  local orange="166"
  local red="160"
  local magenta="125"
  local violet="61"
  local blue="33"
  local cyan="37"
  local green="64"

  export FZF_DEFAULT_COMMAND='ag --hidden -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_CTRL_R_OPTS="--preview-window down:3 --preview 'echo {}'"
  export FZF_TMUX=0

  # Comment and uncomment below for the light theme.

  # Solarized Dark color scheme for fzf
  export FZF_DEFAULT_OPTS="
    --color fg:-1,bg:-1,hl:$blue,fg+:$base2,bg+:$base02,hl+:$blue
    --color info:$yellow,prompt:$yellow,pointer:$base3,marker:$base3,spinner:$yellow
  "
  ## Solarized Light color scheme for fzf
  # export FZF_DEFAULT_OPTS="
   # --color fg:-1,bg:-1,hl:$blue,fg+:$base02,bg+:$base2,hl+:$blue
   # --color info:$yellow,prompt:$yellow,pointer:$base03,marker:$base03,spinner:$yellow
  # "
}
_gen_fzf_default_opts
export FZF_COMPLETION_TRIGGER=''
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion
# fbr - checkout git branch
fbr() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}
# fbrr - checkout git branch (including remote branches)
fbrr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
         }
# fcoc - checkout git commit
fcoc() {
  local commits commit
  commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}
# fbx - delete git branch
fbx() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git branch --delete $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}
# fbX - force delete git branch
fbX() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git branch --delete --force $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}
# fundo - undo changes of a file
fundo() {
  local s file
  s=$(git status -s | fzf +m) &&
  file=$(echo "$s" | awk '{print $2}') &&
  git checkout -- $file &&
  echo "undo changes of $file"
}
# fpc - push commit
fpc() {

}

# fzf - fasd integration
unalias z
z() {
  local dir
  dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}

# fkill - kill process
fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m --preview-window down:3 --preview 'echo {}' | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}

hubpr() {
  hub pull-request -o -F - --edit <<< "$(git log -1 --pretty=format:%s)

https://rangeme.atlassian.net/browse/$(git rev-parse --abbrev-ref HEAD | cut -c1-7)
$(git log -1 --pretty=format:%b)"
}

# Load nvm
# export NVM_DIR="$HOME/.nvm"
# . "/usr/local/opt/nvm/nvm.sh"
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/JJ/.nvm/versions/node/v11.9.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/JJ/.nvm/versions/node/v11.9.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/JJ/.nvm/versions/node/v11.9.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/JJ/.nvm/versions/node/v11.9.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/JJ/.nvm/versions/node/v11.9.0/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/JJ/.nvm/versions/node/v11.9.0/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh