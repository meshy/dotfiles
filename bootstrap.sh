#! bin/bash
############################
# Dev setup for Arch linux #
############################

yaourt -S \
    libreoffice-fresh libreoffice-fresh-en-GB \
    terminator xcalib zsh-syntax-highlighting \
    clojure leiningen \
    postgresql openssh tree the_silver_searcher \
    python-virtualenvwrapper \
    git hub-bin tig-git \
    fortune-mod \
    cloc \
    rbenv ruby-build bower heroku-toolbelt \
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
git -C ~/personal/dotfiles/ submodule update --init --recursive

# Install oh-my-zsh, and replace the default theme with custom one
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
perl -pi -e s,robbyrussell,meshy,g ~/.zshrc

# Install softlinks
~/personal/dotfiles/install

# Install shell extras
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
