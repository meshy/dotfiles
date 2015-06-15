#! bin/bash
############################
# Dev setup for Arch linux #
############################

yaourt -S \
    clisp \
    postgresql \
    python-virtualenvwrapper \
    git hub-bin \
    fortune-mod \
    oh-my-zsh-git \
    rbenv ruby-build \
    libmemcached freetype2 \
    vim sublime-text-dev editorconfig-core-c\
    --noconfirm

# Put headers in the right place for `pip install pillow`.
sudo ln -s /usr/include/freetype2 /usr/include/freetype

# Set up postgres clusters, and enable service
sudo -u postgres initdb --locale en_US.UTF-8 -E UTF8 -D '/var/lib/postgres/data'
systemctl enable postgresql.service
systemctl start postgresql.service

# Symlink gnupg and ssh
ln -s /run/media/`whoami`/HoopyEncrypted/.ssh ~
ln -s /run/media/`whoami`/HoopyEncrypted/.gnupg ~

# Do stuff from home folder
cd ~
mkdir ~/personal
cd ~/personal
git clone git@github.com:meshy/dotfiles.git
cd ~

# Install pip config
mkdir -p ~/.config/pip
ln -s ~/personal/dotfiles/pip/pip.conf ~/.config/pip/pip.conf

# Install git setup
ln -s ~/personal/dotfiles/gitignore ~/.gitignore
ln -s ~/personal/dotfiles/gitconfig ~/.gitconfig

# Install gem setup
ln -s ~/personal/dotfiles/gemrc ~/.gemrc

# Install mercurial setup
ln -s ~/personal/dotfiles/hgrc ~/.hgrc

# Install vim
ln -s ~/personal/dotfiles/vimrc ~/.vimrc

# Install editorconfig
ln -s ~/personal/dotfiles/editorconfig ~/.editorconfig

# Replace the default theme with my custom one
mkdir -p $ZSH_CUSTOM/themes
ln -s ~/personal/dotfiles/meshy.zsh-theme $ZSH_CUSTOM/themes/meshy.zsh-theme
perl -pi -e s,robbyrussell,meshy,g ~/.zshrc

# Install shell extras
ln -s ~/personal/dotfiles/sh_rc ~/.sh_rc
echo 'source ~/.sh_rc' >> ~/.zshrc

mkdir ~/code
