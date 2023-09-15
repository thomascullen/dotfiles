fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

# Auto start tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux new-session -A -s main
fi

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

eval "$(rbenv init - zsh)"

alias co="git checkout"
alias gp="git pull"
alias bd="./bin/dev"
alias git_clean='git branch --merged | egrep -v "(^\*|master|main|dev)" | xargs git branch -d'
alias autocop="git status | grep -v 'deleted:' | grep '\.rb\|\.rake' | awk '{print \$NF}' | grep -v db/schema | xargs rubocop -A"
alias dotfiles="cd ~/Developer/dotfiles && nvim"
alias tx="tmux"

if [[ -n "$ITERM_SESSION_ID" ]]; then
  function change-tab-color() {
    echo -ne "\033]6;1;bg;red;brightness;$1\a"
    echo -ne "\033]6;1;bg;green;brightness;$2\a"
    echo -ne "\033]6;1;bg;blue;brightness;$3\a"
  }

  function change-profile() {
    echo -ne "\033]50;SetProfile=$1\a"
  }

  function reset-colors() {
    echo -ne "\033]6;1;bg;*;Default\a"
    change-profile Default
  }

  function colorssh() {
    if [[ "$1" =~ "^ssh |^cx ssh |^kubectl exec |^bin/sfctl |^heroku run" ]]; then
      if [[ "$*" =~ "production" || "$*" =~ "heroku run rails" ]]; then
        change-profile SSH
        change-tab-color 255 0 0
      elif [[ "$*" =~ "raspberrypi.local|raspberrypi4.local" ]]; then
        change-profile RPI
        change-tab-color 0 255 0
      fi
    else
      reset-colors
    fi
  }

  autoload -U add-zsh-hook
  add-zsh-hook precmd reset-colors
  add-zsh-hook preexec colorssh
fi

autoload -Uz compinit && compinit

# pnpm
export PNPM_HOME="/Users/thomascullen/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
# bun completions
[ -s "/Users/thomascullen/.bun/_bun" ] && source "/Users/thomascullen/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
