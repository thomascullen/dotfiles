# Use starship prompt if available
if command -v starship &> /dev/null; then
	eval "$(starship init zsh)"
	export STARSHIP_CONFIG="$(dirname "$0")/starship.toml"
fi

# Setup completions
autoload -Uz compinit
compinit

# makes color constants available
autoload -U colors
colors

# Auto start tmux
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux new-session -A -s main
# fi

# if env file exists, load it
if [ -f "$(dirname "$0")/env.sh" ]; then
	source "$(dirname "$0")/env.sh"
fi

export EDITOR=nvim

source "$(dirname "$0")/aliases.sh"
