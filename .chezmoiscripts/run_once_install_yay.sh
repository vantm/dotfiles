#!/bin/bash
sudo pacman -Syu git base-devel 

cd $HOME/work/yay-bin

makepkg -si
