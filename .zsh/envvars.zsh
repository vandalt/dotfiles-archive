### Path
#
# Perl stuff
if ! [[ "$PATH" =~ "/usr/bin/core_perl:" ]]
then
    PATH="/usr/bin/core_perl:$PATH"
fi


# Things for non-login shells
if [[ ! -o login ]]
then

    # Python tools
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    export PATH="$HOME/.poetry/bin:$PATH"
    #
    # Home bin(s)
    if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
    then
        PATH="$HOME/.local/bin:$HOME/bin:$HOME/.cargo/bin:$PATH"
    fi
    # This is for archlinux installation with openblas
    export THEANO_FLAGS=blas__ldflags="-L/usr/lib/ -lopenblas"

    # Doom emacs command
    export PATH="$HOME/.emacs.d/bin:$PATH"

    ### Linear algebra
    # MKL
    export MKL_DYNAMIC=FALSE
    export MKL_CBWR=COMPATIBLE
    export MKL_NUM_THREADS=1
    # OPENBLAS
    export OPENBLAS_NUM_THREADS=1
    # Note: OMP changes nproc to 1
    # export OMP_NUM_THREADS=1
    # Others
    export VECLIB_MAXIMUM_THREADS=1
    export NUMEXPR_NUM_THREADS=1

fi


# export path
export PATH

### Text editor
export EDITOR="nvim"

# QT apps
# export QT_QPA_PLATFORM=wayland
# export QT_STYLE_OVERRIDE=adwaita
# export QT_QPA_PLATFORMTHEME=wayland-egl
# export QT_WAYLAND_FORCE_DPI=96

# Wayland things
# For sway: Make sure backend is detected
export MPLBACKEND=TkAgg
if [ -n "$WAYLAND_DISPLAY" ]
then
    export XDG_SESSION_TYPE=wayland
    export XDG_CURRENT_DESKTOP=sway
    export QT_QPA_PLATFORM=wayland
    export QT_QPA_PLATFORMTHEME=qt5ct
    export GDK_BACKEND=wayland
    export _JAVA_AWT_WM_NONREPARENTING=1
fi
export MOZ_ENABLE_WAYLAND=1
export MOZ_DBUS_REMOTE=1
