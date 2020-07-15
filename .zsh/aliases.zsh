# Use neovim
alias v='nvim'
alias vim='nvim'
alias cnvim='nvim ~/.config/nvim/init.vim'

# Onedrive
alias onestat='systemctl --user status onedrive'
alias onesync='onedrive --synchronize'
alias oneresync='onedrive --synchronize --resync'
alias onemonit='onedrive --monitor'

# Git dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias cst='config status'
alias ca='config add'
alias ccmsg='config commit -m'
alias cb='config branch'
alias ccb='config checkout -b'
alias cco='config checkout'
alias cdf='config diff'
alias cpsh='config push'


# Two dirs up
alias ...="cd ../.."

# Python dev
jlab='jupyter lab'
jnote='jupyter notebook'

# Conda
alias cup='conda clean -pity; conda update --all'
alias castro='conda activate astro'
alias cbase='conda activate base'

# Utils
alias ll='ls -lh'
alias la='ls -A'
alias dh='du -sch *'
alias dha='du -d 1 -h .'
alias untar='tar -xvf'
alias guntar='tar -xzvf'
alias buntar='tar -xjvf'
alias open='xdg-open'
