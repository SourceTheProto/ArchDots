#!/bin/bash
echo "Creating .config, if it complains about already existing, that's a good sign."
mkdir ~/.config
echo "Stowing files..."
stow --ignore=install\.sh --dotfiles .
