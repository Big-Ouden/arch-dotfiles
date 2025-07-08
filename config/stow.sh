#!/usr/bin/env bash

# Répertoire contenant les dotfiles
DOTFILES_DIR="$HOME/arch-dotfiles/config"

cd "$DOTFILES_DIR"

stow -t "$HOME" --dotfiles . -v
