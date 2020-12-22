#
# ~/.bashrc
#

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# GTK theme for QT apps
export QT_QPA_PLATFORMTHEME=gtk2
export QT_QPA_PLATFORM="xcb"

# >>> conda initialize >>>
# Removed the first option because it slowed terminal down
if [ -f "/home/vandal/miniconda3/etc/profile.d/conda.sh" ]; then
    . "/home/vandal/miniconda3/etc/profile.d/conda.sh"
else
    export PATH="/home/vandal/miniconda3/bin:$PATH"
fi
# <<< conda initialize <<<

# For termite to work properly
TERM=xterm-color

# Alias for dotfiles git
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# For new terminal in same dir
# source /etc/profile.d/vte.sh

# Alias for vim
#alias vim='vimx'  # gvim terminal
alias vim='nvim'  # neovim


# Alias for conda astro
alias condastro='conda activate astro'

# Onedrive aliases
alias onestat='systemctl --user status onedrive'
alias onesync='onedrive --synchronize'
alias oneresync='onedrive --synchronize --resync'
alias onemonit='onedrive --monitor'

#if [ -f `which powerline-daemon` ]; then
#  powerline-daemon -q
#  POWERLINE_BASH_CONTINUATION=1
#  POWERLINE_BASH_SELECT=1
#  . /usr/share/powerline/bash/powerline.sh
#fi
alias apero="source $HOME/astro-dev/apero/default/apero.bash.setup"
