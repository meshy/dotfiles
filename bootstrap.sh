#! bin/bash
############################
# Dev setup for Arch linux #
############################

# Symlink gnupg and ssh
mv ~/.ssh ~/.ssh.old
mv ~/.gnupg ~/.gnupg.old
ln -s /run/media/`whoami`/TunnelEncrypted/.ssh ~
ln -s /run/media/`whoami`/TunnelEncrypted/.gnupg ~

yaourt -Syyuu

yaourt -R libreoffice-still --noconfirm

yaourt -S \
    libreoffice-fresh libreoffice-fresh-en-GB \
    tilix-bin xcalib zsh-syntax-highlighting most \
    postgresql openssh tree the_silver_searcher fzf \
    python-virtualenvwrapper \
    git hub-git tig git-extras \
    fortune-mod lolcat \
    sdcv stardict-oald stardict-thesaurus-ee \
    cloc cheat-git \
    clojure leiningen \
    go \
    rust \
    rbenv ruby-build bower heroku-toolbelt \
    libmemcached freetype2 ttf-fantasque-sans \
    pygmentize python-pygments \
    vim neovim python-neovim editorconfig-core-c ctags xsel \
    python-isort \
    pv \
    --noconfirm

# Put headers in the right place for `pip install pillow`.
sudo ln -s /usr/include/freetype2 /usr/include/freetype

# Set up postgres clusters, and enable service
sudo -u postgres initdb --locale en_GB.UTF-8 -E UTF8 -D '/var/lib/postgres/data'
systemctl enable postgresql.service
systemctl start postgresql.service

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

gsettings set $KEY_BINDING:$CUSTOM_0 name 'Tilix'
gsettings set $KEY_BINDING:$CUSTOM_0 command 'tilix'
gsettings set $KEY_BINDING:$CUSTOM_0 binding '<Primary><Alt>t'

gsettings set $KEY_BINDING:$CUSTOM_1 name 'Invert colours'
gsettings set $KEY_BINDING:$CUSTOM_1 command 'xcalib -invert -alter'
gsettings set $KEY_BINDING:$CUSTOM_1 binding '<Primary><Alt>i'

# Disable bluetooth
systemctl stop bluetooth
systemctl disable bluetooth
