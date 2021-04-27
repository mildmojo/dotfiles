# Gulp CLI completions
eval "$(gulp --completion=bash)"

alias less="zless"
alias b="bundle exec"
alias open=xdg-open
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"
alias youtube-dl="youtube-dl -x --audio-quality 2 --audio-format mp3"

alias grom="git pull --rebase origin master"
alias groma="git pull --rebase origin main"
alias grod="git pull --rebase origin develop"
alias grc="git rebase --continue"
alias git_url="git config --get remote.origin.url"
alias gam="git commit --amend --reuse-message=HEAD"

alias k=kubectl
complete -F __start_kubectl k

alias dc=docker-compose

alias kc="kubectl config use-context"
alias kn="kubectl config set-context --current --namespace"

alias adb="~/android/platform-tools/adb"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
