#!/bin/bash
sudo pacman -S --noconfirm --needed i3 rofi ranger nitrogen picom polybar zsh yay kitty font-manager

#change ZDOTDIR to ~/.config/zsh
if grep -qxF 'ZDOTDIR=/home/alessandro/.config/zsh' /etc/profile; then
    echo "ZDOTDIR already set"
else
    sudo sh -c "echo ZDOTDIR=/home/$(whoami)/.config/zsh >> /etc/profile"
fi

#install oh-my-zsh
if [ -d ~/.oh-my-zsh ]; then
    echo "oh-my-zsh already installed"
else
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

#install PowerLevel10k zsh theme
if [ -d ~/.oh-my-zsh/custom/themes/powerlevel10k ]; then
    echo "powerlevel10k already installed"
else
    git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

if [ -d ~/.asdf ]; then
    echo "asdf already installed"
else
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf
fi

#!/usr/bin/zsh

asdf plugin add chezmoi && asdf install chezmoi 2.29.2
asdf global chezmoi latest

chezmoi init AlessandroAmboni

if ! pacman -Qs pokemon-colorscripts-git > /dev/null ; then yay -S pokemon-colorscripts-git; fi

