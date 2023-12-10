
alias git_clean='git branch --merged | egrep -v "(^\*|master|main|dev)" | xargs git branch -d'
alias dotfiles="cd ~/Developer/dotfiles && nvim"
alias tx="tmux"
alias vim="nvim"
