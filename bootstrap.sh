#! bin/bash
############################
# Dev setup for Arch linux #
############################

## Move gnupg and ssh aside
# mv ~/.ssh ~/.ssh.old
# mv ~/.gnupg ~/.gnupg.old
## Generate a new key
# ssh-keygen -t ed25519

yay -Syyuu

yay -R libreoffice-still --noconfirm

yay -S \
    `# Theming` \
    gnome-shell-extension-topicons-plus chrome-gnome-shell-git \
    materia-theme pop-icon-theme xcursor-oxygen \
    ttf-fantasque-sans noto-fonts-emoji \
    `# Terminal` \
    kitty xcalib zsh-syntax-highlighting most \
    openssh tree the_silver_searcher fzf \
    git hub-git tig git-extras gitree \
    python-pew \
    sdcv stardict-oald stardict-thesaurus-ee \
    cloc cheat-git \
    bat \
    task \
    `# Languages` \
    clojure leiningen \
    go \
    rust \
    rbenv ruby-build bower heroku-toolbelt \
    nodejs npm yarn \
    `# Services` \
    postgresql libmemcached freetype2 \
    stubby \
    `# Editing text` \
    vim neovim python-neovim editorconfig-core-c ctags xsel \
    `# Linting` \
    python-isort \
    shellcheck \
    yamllint \
    python-pre-commit \
    `# Passwords` \
    bitwarden \
    pv \
    pass \
    `# Email` \
    neomutt urlview msmtp offlineimap notmuch-runtime elinks \
    `# Virtualisation` \
    docker docker-compose \
    `# Office`
    libreoffice-fresh libreoffice-fresh-en-gb \
    `# Random tools` \
    peek \
    bind-tools \
    --noconfirm

# Put headers in the right place for `pip install pillow`.
sudo ln -s /usr/include/freetype2 /usr/include/freetype

# Set up postgres clusters, and enable service
sudo -u postgres initdb --locale en_GB.UTF-8 -E UTF8 -D '/var/lib/postgres/data'
systemctl enable postgresql.service
systemctl start postgresql.service

# Enable DNSSEC in stubby
sudo sed -i -e "s/^# dnssec_return_status*/dnssec_return_status/" /etc/stubby/stubby.yml
# Start stubby DNS server
systemctl enable stubby.service
systemctl start stubby.service

# Download dotfiles
DOTFILES_DIR=~/personal/dotfiles
mkdir -p ~/personal
git clone git@github.com:meshy/dotfiles.git $DOTFILES_DIR
git -C $DOTFILES_DIR submodule update --init --recursive

# Install oh-my-zsh, and replace the default prompt with custom one
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
perl -pi -e s,robbyrussell,meshy,g ~/.zshrc

# Install softlinks
$DOTFILES_DIR/install

# Install shell extras
echo 'source ~/.sh_rc' >> ~/.zshrc

# Make a directory to store code projects
mkdir -p ~/code

# Install "alex" to lint for considerate writing
sudo npm install alex --global

# Install email syncing service
systemctl enable offlineimap.service --user
systemctl start offlineimap.service --user

# Configure gnome keyboard shortcuts
# See http://askubuntu.com/a/597414/30904
MEDIA_KEYS="org.gnome.settings-daemon.plugins.media-keys"
KEY_BINDING=$MEDIA_KEYS".custom-keybinding"
KEY_BINDING_PATH="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"
CUSTOM_0=$KEY_BINDING_PATH"/custom0/"
CUSTOM_1=$KEY_BINDING_PATH"/custom1/"

gsettings set $MEDIA_KEYS custom-keybindings "['$CUSTOM_0', '$CUSTOM_1']"

gsettings set $KEY_BINDING:$CUSTOM_0 name 'Open terminal'
gsettings set $KEY_BINDING:$CUSTOM_0 command 'kitty'
gsettings set $KEY_BINDING:$CUSTOM_0 binding '<Primary><Alt>t'

gsettings set $KEY_BINDING:$CUSTOM_1 name 'Invert colours'
gsettings set $KEY_BINDING:$CUSTOM_1 command 'xcalib -invert -alter'
gsettings set $KEY_BINDING:$CUSTOM_1 binding '<Primary><Alt>i'


echo "Don't forget to install the gTile extension https://github.com/gTile/gTile"
