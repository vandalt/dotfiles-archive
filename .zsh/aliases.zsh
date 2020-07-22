# enable colors in ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Use neovim
alias v='nvim'
alias vim='nvim'
alias cnvim='nvim ~/.config/nvim/init.vim'

# Onedrive
alias onestat='systemctl --user status onedrive'
alias onestop='systemctl --user stop onedrive'
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
alias jlab='jupyter lab'
alias jnote='jupyter notebook'

# Conda
alias cup='conda clean -pity; conda update --all'
alias castro='conda activate astro'
condastro='conda activate astro'
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
alias sc='screen'
alias scr='screen -r'
alias scs='screen -S'
