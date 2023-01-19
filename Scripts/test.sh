#!/bin/bash

#change ZDOTDIR to ~/.config/zsh
if grep -qxF "export ZDOTDIR=/home/$(whoami)/.config/zsh" /etc/zsh/zshenv; then
    echo "ZDOTDIR already set"
else
    sudo touch /etc/zsh/zshenv
    sudo bash -c "echo export ZDOTDIR=/home/$(whoami)/.config/zsh >> /etc/zsh/zshenv"
    sudo sh -c "sudo source /etc/zsh/zshenv"
fi
