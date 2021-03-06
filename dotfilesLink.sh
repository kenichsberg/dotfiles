#!/bin/sh
ln -sf ~/dotfiles/.vimrc ~/.vimrc
mkdir -p ~/.vim/tmp/swap
mkdir -p ~/.vim/tmp/backup
mkdir -p ~/.vim/tmp/undo

ln -sf ~/dotfiles/.zshenv ~/.zshenv
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

mkdir -p ~/.config/alacritty
ln -sf ~/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
