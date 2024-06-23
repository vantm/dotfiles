#/bin/bash

cp ~/.zprofile .zprofile
cp ~/.zshrc .zshrc
cp ~/.ideavimrc .ideavimrc
cp ~/.tmux.conf .tmux.conf

mkdir -p .config/mpd
cp ~/.config/mpd/mpd.conf .config/mpd

cp -r ~/.config/hypr .config
cp -r ~/.config/kitty .config
cp -r ~/.config/lazygit .config
cp -r ~/.config/nvim .config
cp -r ~/.config/rofi .config
cp -r ~/.config/swayidle .config
cp -r ~/.config/swaylock .config
cp -r ~/.config/waybar .config
