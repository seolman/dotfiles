#!/usr/bin/env bash

echo "once"

sudo pacman -S --noconfirm xdg-user-dirs
xdg-user-dirs-update

sudo pacman -S --noconfirm --needed git base-devel

cd $HOME
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd $HOME
rm -rf paru

sudo pacman -S -noconfirm xorg xorg-init

mkdir -p $HOME/Code/personal

cd $HOME/Code/personal
git clone https://github.com/seolman/dwm.git
cd dwm
sudo make clean install

cd $HOME/Code/personal
git clone https://github.com/seolman/dmenu.git
cd dmenu
sudo make clean install
cd $HOME

cd $HOME/Code/personal
git clone https://github.com/seolman/st.git
cd st
sudo make clean install
cd $HOME
