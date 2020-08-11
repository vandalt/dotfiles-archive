# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Vi mode
bindkey -v

# Keep a few emacs bindings
bindkey '^l' clear-screen
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^f' forward-char
bindkey '^b' backward-char
bindkey '^p' up-line-or-history
bindkey '^n' down-line-or-history
bindkey '^d' delete-char-or-list
bindkey '^h' backward-delete-char
bindkey '^[d' kill-word
bindkey '^[^h' backward-kill-word

# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# Source Powerlevel10k
source $HOME/.zsh/powerlevel10k/powerlevel10k.zsh-theme

# Source syntax highlighting
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Source autosuggestions
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Source all config files
for config_file ($HOME/.zsh/*.*sh) source $config_file

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# QT apps
export QT_QPA_PLATFORMTHEME=gtk2
# export QT_QPA_PLATFORMTHEME=wayland-egl
# export QT_WAYLAND_FORCE_DPI=96

# Firefox on wayland
MOZ_ENABLE_WAYLAND=1
export MOZ_ENABLE_WAYLAND
