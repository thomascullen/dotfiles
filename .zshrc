source /Users/thomascullen/Developer/dotfiles/zsh/init.sh

# fpath+=$HOME/.zsh/pure
# autoload -U promptinit; promptinit
# prompt pure

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

eval "$(rbenv init - zsh)"

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

