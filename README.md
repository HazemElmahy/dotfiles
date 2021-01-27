 i3 xbacklight compton feh tmux zsh ranger cmus xclip kitty git rofi
 git-svn xkb switch gh-cli 

## i3blocks
git clone https://github.com/vivien/i3blocks
cd i3blocks
./autogen.sh
./configure
make
make install

## Molokia
cd ~/.vim

svn checkout https://github.com/tomasr/molokai/truck/colors

## vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/kutsan/zsh-system-clipboard ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-system-clipboard
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
