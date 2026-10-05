#!/bin/sh

# Note: The names for the Arc theme variations are terrible.
# "Darker" is actually LESS DARK than "Dark".

gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3
gsettings set org.gnome.desktop.interface color-scheme prefer-light

mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}/gtk-3.0"

cat > "${XDG_CONFIG_HOME:-$HOME/.config}/gtk-3.0/settings.ini" <<EOF
[Settings]
gtk-theme-name=adw-gtk3
gtk-application-prefer-dark-theme=false
EOF
