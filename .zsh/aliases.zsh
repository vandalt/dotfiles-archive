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

# Kitty
if [ $TERM = "xterm-kitty" ]; then
    alias icat="kitty +kitten icat"
    alias ssh="kitty +kitten ssh"
fi

# Config files I access often
alias cconf='nvim ~/.config/'
alias cnvim='nvim ~/.config/nvim/init.lua'
alias csway='nvim ~/.config/sway/config'

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

# Git private dotfiles
alias pconfig='/usr/bin/git --git-dir=$HOME/.private_dotfiles/ --work-tree=$HOME'
alias pcst='pconfig status'
alias pca='pconfig add'
alias pccmsg='pconfig commit -m'
alias pcb='pconfig branch'
alias pccb='pconfig checkout -b'
alias pcco='pconfig checkout'
alias pcdf='pconfig diff'
alias pcpsh='pconfig push'

# Two dirs up
alias ...="cd ../.."

# Taskwarrior
alias t="task"
alias ta="task add"
alias td="task done"
alias tover="task +OVERDUE"
alias tact="task +ACTIVE"

# Python
alias jlab='jupyter lab'
alias p='ipython'
# enable shared libraries (requied for some packages like theano)
alias spyenv='env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv'
alias psh='poetry shell'

# Power
alias sdn='shutdown now'

# Starting chromium/electron in wayland
alias code='code --enable-features=UseOzonePlatform --ozone-platform=wayland'

# Utils
alias l='ls'
alias sl='ls'
alias ll='ls -lh'
alias la='ls -A'
alias lla='ls -lA'
alias rmr='rm -r'
alias rmrf='rm -rf'
alias dh='du -sch *'
alias dha='du -d 1 -h .'
alias untar='tar -xvf'
alias guntar='tar -xzvf'
alias buntar='tar -xjvf'
alias open='xdg-open'
alias scr='screen -r'
alias scs='screen -S'
alias scls='screen -ls'
