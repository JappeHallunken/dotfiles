#!/bin/sh

# Note: The names for the Arc theme variations are terrible.
# "Darker" is actually LESS DARK than "Dark".

gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3-dark
gsettings set org.gnome.desktop.interface color-scheme prefer-dark

mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}/gtk-3.0"

cat > "${XDG_CONFIG_HOME:-$HOME/.config}/gtk-3.0/settings.ini" <<EOF
[Settings]
gtk-theme-name=adw-gtk3-dark
gtk-application-prefer-dark-theme=true
EOF
