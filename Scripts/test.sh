#!/bin/bash

#change ZDOTDIR to ~/.config/zsh
if grep -qxF 'ZDOTDIR=/home/$(whoami)/.config/zsh' /etc/zsh/zshenv; then
    echo "ZDOTDIR already set"
else
    sudo touch /etc/zsh/zshenv && sudo "echo export ZDOTDIR=/home/$(whoami)/.config/zsh >> /etc/zsh/zshenv"
fi
