#!/bin/bash

# function to create symlinks
function create_link() {
	local sourceFile=$1
	local targetFile=$2

	if [ -L "$targetFile" ]; then
		echo "Removing existing symlink $targetFile"
		rm "$targetFile"
	fi

	ln -s "$sourceFile" "$targetFile"

	echo "Symlinking $sourceFile -> $targetFile"
}

create_link "$(pwd)/nvim" "$HOME/.config/nvim"
create_link "$(pwd)/tmux.conf" "$HOME/.tmux.conf"
create_link "$(pwd)/tmux" "$HOME/.tmux"
create_link "$(pwd)/wezterm.lua" "$HOME/.wezterm.lua"

zsh_init="source $(pwd)/zsh/init.sh"
echo "zsh init: $zsh_init"
if ! grep -q "$zsh_init" "$HOME/.zshrc"; then
	echo "Adding zsh init to .zshrc"
	echo "$zsh_init" >> "$HOME/.zshrc"
fi

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle
source ~/.zshrc
