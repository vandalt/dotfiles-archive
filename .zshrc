# Enable conda completion
fpath+=$HOME/.zsh/conda-zsh-completion

# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# Source Powerlevel10k
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Source syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Source autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Source all config files
for config_file ($HOME/.zsh/*.*sh) source $config_file

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

if ! [[ "$PATH" =~ "/usr/bin/core_perl:" ]]
then
    PATH="/usr/bin/core_perl:$PATH"
fi

export PATH

# QT apps
# export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=gtk2
# export QT_QPA_PLATFORMTHEME=wayland-egl
# export QT_WAYLAND_FORCE_DPI=96

# Firefox on wayland
MOZ_ENABLE_WAYLAND=1
export MOZ_ENABLE_WAYLAND
