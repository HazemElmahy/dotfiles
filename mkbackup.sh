#!/bin/bash

git_push() {
    echo $HOME
    echo $(whoami)
    git diff --name-only
    git add --all
    echo "ADDED"
    read -p "Comment: " comment_msg
    git commit -m "$comment_msg"
    echo "COMMITED"
    git push origin
    echo "PUSHED"
}


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
    cp -r /home/hazem/.local/share/nvim/ /home/hazem/dotfiles/.config/
    cp -r /home/hazem/.config/nvim/ /home/hazem/dotfiles/.config/

    echo "HEREE"
    sudo -u hazem $(git_push)

elif [[ "$1" == "install" ]]; then
    echo "TODO"

fi

