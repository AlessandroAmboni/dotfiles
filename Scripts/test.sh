#!/bin/bash

#change ZDOTDIR to ~/.config/zsh
if grep -qxF "export ZDOTDIR=/home/$(whoami)/.config/zsh" /etc/zsh/zshenv; then
    echo "ZDOTDIR already set"
else
    sudo touch /etc/zsh/zshenv && echo "export ZDOTDIR=/home/$(whoami)/.config/zsh" | sudo tee -a /etc/zsh/zshenv
fi
