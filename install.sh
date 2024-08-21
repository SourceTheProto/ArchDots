#!/bin/bash

SCRIPT_DIR=$(pwd)
CONFIG_DIR=~/.config

# Grab Neovim configs from git
echo "Cloning neovim config..."
git clone https://github.com/SourceTheProto/kickstart.nvim ./nvim

# Go to configs directory to put symlinks in
cd $CONFIG_DIR

# Make symbolic links to dotfiles directory
echo "Making symlinks to ~/.config"
rm -rf $CONFIG_DIR/eww
ln -sv $SCRIPT_DIR/eww
rm -rf $CONFIG_DIR/mpv
ln -sv $SCRIPT_DIR/mpv
rm -rf $CONFIG_DIR/hypr
ln -sv $SCRIPT_DIR/hypr
rm -rf $CONFIG_DIR/rofi
ln -sv $SCRIPT_DIR/rofi
rm -rf $CONFIG_DIR/kitty
ln -sv $SCRIPT_DIR/kitty
rm -rf $CONFIG_DIR/qt5ct
ln -sv $SCRIPT_DIR/qt5ct
rm -rf $CONFIG_DIR/qt6ct
ln -sv $SCRIPT_DIR/qt6ct
rm -rf $CONFIG_DIR/waybar
ln -sv $SCRIPT_DIR/waybar
rm -rf $CONFIG_DIR/yt-dlp
ln -sv $SCRIPT_DIR/yt-dlp
rm -rf $CONFIG_DIR/Kvantum
ln -sv $SCRIPT_DIR/Kvantum
rm -rf $CONFIG_DIR/OpenRGB
ln -sv $SCRIPT_DIR/OpenRGB
rm -rf $CONFIG_DIR/WebCord
ln -sv $SCRIPT_DIR/WebCord
rm -rf $CONFIG_DIR/thefuck
ln -sv $SCRIPT_DIR/thefuck
rm -rf $CONFIG_DIR/wlogout
ln -sv $SCRIPT_DIR/wlogout
rm -rf $CONFIG_DIR/FreeTube
ln -sv $SCRIPT_DIR/FreeTube
rm -rf $CONFIG_DIR/swaylock
ln -sv $SCRIPT_DIR/swaylock
rm -rf $CONFIG_DIR/obs-studio
ln -sv $SCRIPT_DIR/obs-studio
rm -rf $CONFIG_DIR/easyeffects
ln -sv $SCRIPT_DIR/easyeffects
rm -rf $CONFIG_DIR/nvim
ln -sv $SCRIPT_DIR/nvim
ln -sfv $SCRIPT_DIR/starship.toml
ln -sfv $SCRIPT_DIR/electron28-flags.conf
ln -sfv $SCRIPT_DIR/spotify-launcher.conf
