###########
# ALIASES #
###########

alias ag=${AG_COMMAND}
alias ig=${AG_COMMAND} --ignore migrations
alias b='black'
alias ccat='bat'
alias f='flake8 . --exclude=node_modules'
alias fix='stty sane'
alias ep='neomutt -F ~/.mutt/personal.muttrc && notmuch --config ~/.notmuch-config.personal new'
alias g='git'
alias kc='kubectl'
alias m="make test"
alias mf="make testfast"
alias m2="make test VERBOSITY=2"
alias open='xdg-open'
alias op="offlineimap -c ~/.offlineimaprc.personal -o"
alias pi="pip install"
alias t='tree -I "__pycache__|*.pyc" -C --dirsfirst'
alias vim='nvim'
alias vi='nvim'
alias v='nvim'
alias wo='pew workon'
alias fig='docker-compose'
alias reload='source ~/.zshrc'

# Alias hub to git, passing all args.
alias git=hub

# Bash Directory browsing shortcuts
alias k='tree'
alias ltr='ls -ltr'
alias r='screen -D -R'
alias ls='ls --color'
alias l='ls -lh'
alias ll='ls -la'

# Subpixel ordering for rotated monitors
alias vbgr="gsettings set org.gnome.settings-daemon.plugins.xsettings rgba-order 'vbgr'"
alias vrgb="gsettings set org.gnome.settings-daemon.plugins.xsettings rgba-order 'vbgr'"
alias rgb="gsettings set org.gnome.settings-daemon.plugins.xsettings rgba-order 'rgb'"
alias vert="vbgr"
alias horiz="rgb"

# How meta is this?!
alias cdd='cd ~/personal/dotfiles'

# Weather on the moon...
alias moon='curl wttr.in/moon'

# Dictionary/Thesaurus
alias dict="sdcv --color"

# Work around the infernal ghostscript
alias gs="git status"

# Display an image in the terminal. Only works in kitty.
alias img="kitty icat"

# Fix consequences of strange TERM when using kitty to ssh.
alias ksh="kitty +kitten ssh"

# Open a file in vim with CTRL-P
function fzf_to_vim {
    local file
    file=$( fzf --no-mouse )
    if [[ $? != 0 ]]; then; return 1; fi
    # Add executed command to history
    print -s "vim \"${file}\""
    vim "${file}"
}
bindkey -s ^p '^Ufzf_to_vim^M'

# work on a project with CTRL-O
function workon {
    local file
    file=$( pew ls | tr ' ' '\n' | fzf --no-mouse --layout=reverse --height=20)
    if [[ $? != 0 ]]; then; return 1; fi
    print -s "pew workon \"${file}\""
    pew workon "${file}"
}
bindkey -s ^o '^Uworkon^M'

#############
# FUNCTIONS #
#############

function af {
    defaultpath=.
    find ${2:-$defaultpath} ! -iwholename '*.git*' | grep -v "/.mypy_cache/" | grep -v "/node_modules/" | grep ${1}
}

# Open search results in vim
function vag {
    search_term=$@
    _files=$(ag --hidden --files-with-matches --ignore-dir=".git" $search_term | sort | xargs)
    if [[ $_files != "" ]]; then
        echo "nvim $_files +/${search_term}"
        nvim $(echo $_files) +/${search_term}
    else
        echo "No results."
    fi
}

# Create a virtual environment.
function _mkvenv {
    name="${1}"
    _python="${2}"
    pew new $name \
        -a "$(pwd)" \
        -p "$_python"
}
function mkvenv3 {
    defaultname=`basename $PWD`
    _mkvenv "${1:-$defaultname}" "$(which python3)"
}
function mkvenv2 {
    defaultname=`basename $PWD`
    _mkvenv "${1:-$defaultname}" "$(which python2)"
}


# Install requirements with pip
function pp {
    defaultfile='requirements.txt'
    requirementsfile=${1:-$defaultfile}
    pi -r $requirementsfile
}

# Check the weather!
function weather {
    defaultcity='oxford'
    curl wttr.in/${1:-$defaultcity}\?m
}

function mkmodule {
    if [[ $# -eq 0 ]] ; then
        echo 'Module path required: `mkmodule path/to/module`'
    else
        mkdir $1
        touch $1/__init__.py
    fi
}
