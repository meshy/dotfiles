#! bin/bash

# Install packages
# sudo apt-get install git python-dev build-essential libjpeg-dev libpng12-dev zsh gnome-shell synapse gparted gimp ubuntu-restricted-extras vlc ttf-mscorefonts-installer sqlite ruby quicksynergy postgresql-server-dev-all ack-grep sparkleshare ia32-libs memcached libmemcached-dev

# Install zsh
# wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

# Do stuff from home folder
cd ~
mkdir personal
cd personal
git clone git@github.com:meshy/dotfiles.git
cd ~

# Install git setup
ln -s ~/personal/dotfiles/gitignore ~/.gitignore
ln -s ~/personal/dotfiles/gitconfig ~/.gitconfig

# Install gem setup
ln -s ~/personal/dotfiles/gemrc ~/.gemrc

# Install mercurial setup
ln -s ~/personal/dotfiles/hgrc ~/.hgrc

# Install shell extras
ln -s ~/personal/dotfiles/sh_rc ~/.sh_rc
echo 'source ~/.sh_rc' >> ~/.zshrc

