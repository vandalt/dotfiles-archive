### Path
#
# Python tools
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
#
# Home bin(s)
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
#
# Perl stuff
if ! [[ "$PATH" =~ "/usr/bin/core_perl:" ]]
then
    PATH="/usr/bin/core_perl:$PATH"
fi
export PATH

### Text editor
export EDITOR="vim"

### Linear algebra
# Linear algrebra
# MKL
export MKL_DYNAMIC=FALSE
export MKL_CBWR=COMPATIBLE
export MKL_NUM_THREADS=1
# OPENBLAS
export OPENBLAS_NUM_THREADS=1
# Others
export OMP_NUM_THREADS=1
export VECLIB_MAXIMUM_THREADS=1
export NUMEXPR_NUM_THREADS=1

# QT apps
# export QT_QPA_PLATFORM=wayland
# export QT_QPA_PLATFORMTHEME=gtk2
# export QT_STYLE_OVERRIDE=adwaita
# export QT_QPA_PLATFORMTHEME=wayland-egl
# export QT_WAYLAND_FORCE_DPI=96

# Wayland things
if [ -n "$WAYLAND_DISPLAY" ]
then
    export XDG_SESSION_TYPE=wayland
    export XDG_CURRENT_DESKTOP=sway
    export QT_QPA_PLATFORM=wayland
    export GDK_BACKEND=wayland
fi
export MOZ_ENABLE_WAYLAND=1