#! bin/bash
############################
# Dev setup for Arch linux #
############################

yaourt -S python-virtualenvwrapper hub git oh-my-zsh-git rbenv --noconfirm

# Symlink gnupg and ssh
ln -s /run/media/`whoami`/HoopyEncrypted/.ssh ~
ln -s /run/media/`whoami`/HoopyEncrypted/.gnupg ~

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

# Install vim
ln -s ~/personal/dotfiles/vimrc ~/.vimrc

# Replace the default theme with my custom one
mkdir -p $ZSH_CUSTOM/themes
ln -s ~/personal/dotfiles/meshy.zsh-theme $ZSH_CUSTOM/themes/meshy.zsh-theme
perl -pi -e s,robbyrussell,meshy,g ~/.zshrc

# Install shell extras
ln -s ~/personal/dotfiles/sh_rc ~/.sh_rc
echo 'source ~/.sh_rc' >> ~/.zshrc

