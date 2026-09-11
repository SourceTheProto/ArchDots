#!/bin/bash
echo "DON'T RUN THIS YET IT'S NOT DONE !!1!11!!1"
exit 0

echo "Cloning neovim config..."
git clone https://github.com/SourceTheProto/kickstart.nvim .config/nvim

echo "stowing other files..."
stow --ignore=install\.sh .
