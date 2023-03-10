#!/bin/bash

#setup git user and email
git config --global user.name "Alessandro Amboni"
git config --global user.email "alessandroamboni01@gmail.com"

#install packages and reboot if not already installed
if ! pacman -Qs zsh >/dev/null; then
    sh ./firstInstall.sh 
fi

#change shell to zsh
if [ $SHELL != "/usr/bin/zsh" ]; then
    #chsh -s /bin/zsh
    echo "shell inst zsh"
else
    echo "shell already set to zsh"
fi

#change ZDOTDIR to ~/.config/zsh
#change ZDOTDIR to ~/.config/zsh
if grep -qxF "export ZDOTDIR=/home/$(whoami)/.config/zsh" /etc/zsh/zshenv; then
    echo "ZDOTDIR already set"
else
    sudo touch /etc/zsh/zshenv
    sudo bash -c "echo export ZDOTDIR=/home/$(whoami)/.config/zsh >> /etc/zsh/zshenv"
    sudo sh -c "sudo source /etc/zsh/zshenv"
fi

#install oh-my-zsh
if [ -d ~/.oh-my-zsh ]; then
    echo "oh-my-zsh already installed"
else
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

#install asdf 
if  [ ! -d "$HOME/.asdf" ]; then
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2
fi

#install PowerLevel10k zsh theme
if [ -d ~/.oh-my-zsh/custom/themes/powerlevel10k ]; then
    echo "powerlevel10k already installed"
else
    git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/themes/powerlevel10k
fi

#!/usr/bin/zsh

asdf plugin add chezmoi && asdf install chezmoi 2.29.2
asdf global chezmoi latest

chezmoi init AlessandroAmboni

if ! pacman -Qs pokemon-colorscripts-git >/dev/null; then yay -S pokemon-colorscripts-git; fi
