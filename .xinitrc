setxkbmap -option ctrl:swapcaps,nocaps

export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5

fcitx5 &

xrdb -merge ~/.Xresources

exec spectrwm
