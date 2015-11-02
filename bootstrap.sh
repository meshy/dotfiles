#! bin/bash
############################
# Dev setup for Arch linux #
############################

yaourt -S \
    libreoffice-fresh libreoffice-fresh-en-GB \
    terminator xcalib zsh-syntax-highlighting \
    clojure leiningen \
    postgresql openssh tree \
    python-virtualenvwrapper \
    git hub-bin \
    fortune-mod \
    rbenv ruby-build \
    libmemcached freetype2 ttf-fantasque-sans \
    pygmentize python-pygments \
    vim neovim-git editorconfig-core-c ctags \
    --noconfirm

# Put headers in the right place for `pip install pillow`.
sudo ln -s /usr/include/freetype2 /usr/include/freetype

# Set up postgres clusters, and enable service
sudo -u postgres initdb --locale en_GB.UTF-8 -E UTF8 -D '/var/lib/postgres/data'
systemctl enable postgresql.service
systemctl start postgresql.service

# Symlink gnupg and ssh
ln -s /run/media/`whoami`/HoopyEncrypted/.ssh ~
ln -s /run/media/`whoami`/HoopyEncrypted/.gnupg ~

# Download dotfiles
mkdir -p ~/personal
git -C ~/personal clone git@github.com:meshy/dotfiles.git

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
ln -s ~/personal/dotfiles/vim/init.vim ~/.vimrc
ln -s ~/personal/dotfiles/vim ~/.vim
ln -s ~/personal/dotfiles/vim ~/.config/nvim
git -C ~/personal/dotfiles/ submodule update --init --recursive

# Install editorconfig
ln -s ~/personal/dotfiles/editorconfig ~/.editorconfig

# Install oh-my-zsh, and replace the default theme with custom one
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
mkdir -p $ZSH_CUSTOM/themes
ln -s ~/personal/dotfiles/meshy.zsh-theme $ZSH_CUSTOM/meshy.zsh-theme
ln -s ~/personal/dotfiles/async.zsh $ZSH_CUSTOM/async.zsh
perl -pi -e s,robbyrussell,meshy,g ~/.zshrc

# Install shell extras
ln -s ~/personal/dotfiles/sh_rc ~/.sh_rc
echo 'source ~/.sh_rc' >> ~/.zshrc

# Make a directory to store code projects
mkdir -p ~/code

# Configure gnome keyboard shortcuts
# See http://askubuntu.com/a/597414/30904
MEDIA_KEYS="org.gnome.settings-daemon.plugins.media-keys"
KEY_BINDING=$MEDIA_KEYS".custom-keybinding"
KEY_BINDING_PATH="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"
CUSTOM_0=$KEY_BINDING_PATH"/custom0/"
CUSTOM_1=$KEY_BINDING_PATH"/custom1/"

gsettings set $MEDIA_KEYS custom-keybindings "['$CUSTOM_0', '$CUSTOM_1']"

gsettings set $KEY_BINDING:$CUSTOM_0 name 'Terminator'
gsettings set $KEY_BINDING:$CUSTOM_0 command 'terminator'
gsettings set $KEY_BINDING:$CUSTOM_0 binding '<Primary><Alt>t'

gsettings set $KEY_BINDING:$CUSTOM_1 name 'Invert colours'
gsettings set $KEY_BINDING:$CUSTOM_1 command 'xcalib -invert -alter'
gsettings set $KEY_BINDING:$CUSTOM_1 binding '<Primary><Alt>i'
