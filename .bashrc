#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Add home user bin
export PATH="${PATH}:${HOME}/bin"

# GTK theme for QT apps
export QT_QPA_PLATFORMTHEME=gtk2

# >>> conda initialize >>>
# Removed the first option because it slowed terminal down
if [ -f "/home/vandal/miniconda3/etc/profile.d/conda.sh" ]; then
    . "/home/vandal/miniconda3/etc/profile.d/conda.sh"
else
    export PATH="/home/vandal/miniconda3/bin:$PATH"
fi
# <<< conda initialize <<<

# For NVM
source /usr/share/nvm/init-nvm.sh

# For termite to work properly
TERM=xterm-color

# Alias for dotfiles git
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# For new terminal in same dir
source /etc/profile.d/vte.sh

# Alias for conda astro
alias condastro='conda activate astro'

# Onedrive aliases
alias onestat='systemctl --user status onedrive'
alias onesync='onedrive --synchronize'
alias oneresync='onedrive --synchronize --resync'
alias onemonit='onedrive --monitor'
