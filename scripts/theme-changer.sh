#!/bin/zsh

choices=`ls ~/dotfiles/x/xresources/ | sed "s/.Xresources// ;s/base16-//"`
chosen=$(echo -e "$choices" | dmenu -i)


_base16 "/home/thamoo/.config/base16-shell/scripts/base16-$chosen.sh" $chosen
# base16_$1

sed -i "5s/.*/#include \"\/home\/thamoo\/dotfiles\/x\/xresources\/base16-$chosen.Xresources\"/" ~/dotfiles/x/Xresources
