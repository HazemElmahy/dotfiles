#!/bin/bash

if [[ "$1" == "backup" ]]; then
    mkdir /home/hazem/dotfiles/.config
    mkdir /home/hazem/dotfiles/.zsh
    cp /home/hazem/.vimrc /home/hazem/dotfiles
    cp /home/hazem/.zshrc /home/hazem/dotfiles
    cp /home/hazem/.i3status.conf /home/hazem/dotfiles
    cp /home/hazem/.xinitrc /home/hazem/dotfiles
    cp -r /home/hazem/.vim /home/hazem/dotfiles
    cp -r /home/hazem/.zsh/plugins /home/hazem/dotfiles/.zsh
    cp -r /home/hazem/.config/dunst /home/hazem/dotfiles/.config
    cp -r /home/hazem/.config/kitty /home/hazem/dotfiles/.config
    cp -r /home/hazem/.config/ranger /home/hazem/dotfiles/.config
    cp -r /home/hazem/.config/i3 /home/hazem/dotfiles/.config/

elif [[ "$1" == "install" ]]; then
    echo "TODO"

fi

