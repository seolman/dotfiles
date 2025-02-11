#!/usr/bin/env bash

sudo pacman -S xdg-user-dirs
xdg-user-dirs-update

mkdir -p $HOME/Code/

git clone https://aur.archlinux.org/paru.git $HOME/Code/paru
cd $HOME/Code/paru
makepkg -si

git clone https://github.com/seolman/dwm.git $HOME/Code/dwm
cd $HOME/Code/dwm
sudo make clean install

git clone https://github.com/seolman/st.git $HOME/Code/st
cd $HOME/Code/st
sudo make clean install
