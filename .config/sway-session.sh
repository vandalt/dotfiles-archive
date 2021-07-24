#!/bin/sh

# Sway session for greetd.
# Move this file to greetd directory to use the session.

# Session
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=sway
export XDG_CURRENT_DESKTOP=sway

# Enable wayland for apps
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM=wayland
export GDK_BACKEND=wayland
export _JAVA_AWT_WM_NONREPARENTING=1

# QT Theming in sway
export QT_QPA_PLATFORMTHEME=qt5ct

systemd-cat --identifier=sway sway $@
