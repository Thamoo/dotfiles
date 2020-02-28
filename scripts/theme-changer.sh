#!/bin/zsh

choices=`ls ~/dotfiles/x/xresources/ | sed "s/.Xresources// ;s/base16-//"`
chosen=$(echo -e "$choices" | dmenu -i)


# BASE16_SHELL=$HOME/.config/base16-shell/
# [ -s $BASE16_SHELL/profile_helper.sh ] && \
#               eval "$($BASE16_SHELL/profile_helper.sh)"
base16_icy
# _base16 /home/thamoo/.config/base16-shell/scripts/base16-$chosen.sh $chosen

# sed -i "5s/.*/#include \"\/home\/thamoo\/dotfiles\/x\/xresources\/base16-$chosen.Xresources\"/" ~/dotfiles/x/Xresources
