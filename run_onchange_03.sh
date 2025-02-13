#!/usr/bin/env bash

echo "onchange"

paru -S cmake python python-pip nodejs npm lua51 luarocks rust go zig jdk-openjdk

paru -S zellij tmux \
  helix neovim \
  yazi ffmpeg p7zip jq poppler fd ripgrep fzf zoxide imagemagick \
  starship eza bat bottom less git-delta dust duf sd tealdeer xh procs lazygit hyperfine gping tokei github-cli git-lfs \
  pass \
  syncthing openssh \
  bluez bluez-utils
  
paru -S firefox chromium zen-browser-bin \
  wezterm \
  code obsidian \
  rofi \
  zathura zathura-pdf-mupdf \
  vesktop-bin \
  fcitx5-im fcitx5-hangul noto-fonts-cjk ttf-d2coding-nerd \
  qt6ct lxappearance-gtk3
