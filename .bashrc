#
# ~/.bashrc
#
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$HOME/.cargo/bin:$PATH"
fi
export PATH

# >>> conda initialize >>>
# Stripped down conda init to add conda in path but not activate
if [ -f "/home/vandal/programs/miniconda3/etc/profile.d/conda.sh" ]; then
    . "/home/vandal/programs/miniconda3/etc/profile.d/conda.sh"
else
    export PATH="/home/vandal/miniconda3/bin:$PATH"
fi
# <<< conda initialize <<<

# For termite to work properly
TERM=xterm-color

# Alias for dotfiles git
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Onedrive aliases
alias onestat='systemctl --user status onedrive'
alias onesync='onedrive --synchronize'
alias oneresync='onedrive --synchronize --resync'
alias onemonit='onedrive --monitor'

infsync() {
  while :
  do
      onedrive --synchronize
      echo "STOPPED HERE"
      echo ""
      echo "RESTART"
  done
}

# Neovim alias
alias vim='nvim'
