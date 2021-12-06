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
    `# Build essentials` \
    base-devel \
    `# Theming` \
    gnome-shell-extension-topicons-plus chrome-gnome-shell-git \
    materia-theme pop-icon-theme xcursor-oxygen \
    ttf-fantasque-sans \
    `# Terminal` \
    kitty noto-fonts-emoji \
    starship \
    font-victor-mono \
    xcalib zsh-syntax-highlighting most \
    openssh tree the_silver_searcher fzf \
    git hub tig git-extras git-delta git-secret \
    sdcv stardict-oald stardict-thesaurus-ee \
    cloc cheat-git \
    bat \
    colordiff \
    `# Languages` \
    python-pipx python-pew \
    clojure leiningen \
    go \
    rust \
    ruby rbenv ruby-build bower \
    nodejs npm yarn jq fnm \
    `# Services` \
    postgresql libmemcached freetype2 \
    `# SAAS` \
    heroku-cli google-cloud-sdk \
    `# AWS` \
    aws-cli amazon-ecr-credential-helper \
    `# Kubernetes` \
    kubectx kubectl \
    `# Editing text` \
    vim neovim editorconfig-core-c xsel \
    typescript-language-server-bin \
    `# Creating or editing images` \
    peek optipng jpegoptim \
    `# Linting` \
    shellcheck bashate \
    yamllint \
    `# Virtualisation` \
    docker docker-compose-cli dive lazy-docker \
    `# Office`
    libreoffice-fresh libreoffice-fresh-en-gb \
    `# Keeping notes` \
    obsidian \
    `# Boost input volume` \
    paman \
    `# Random tools` \
    strace bind net-tools \
    cups-xerox-b2xx \
    --noconfirm

pipx install black
pipx install flake8
pipx install isort
pipx install grip
pipx install httpie
pipx install mypy
pipx install pipenv
pipx install poetry
pipx install pre-commit
pipx install python-lsp-server
pipx inject python-lsp-server pylsp-mypy

# Put headers in the right place for `pip install pillow`.
sudo ln -s /usr/include/freetype2 /usr/include/freetype

# Set up postgres clusters, and enable service
sudo -u postgres initdb --locale en_GB.UTF-8 -E UTF8 -D '/var/lib/postgres/data'
systemctl enable postgresql.service
systemctl start postgresql.service

# Add user to docker group
# YOU MUST REBOOT FOR THIS TO TAKE EFFECT.
sudo usermod -aG docker charlie

# Download dotfiles
DOTFILES_DIR=~/personal/dotfiles
mkdir -p ~/personal
git clone git@github.com:meshy/dotfiles.git $DOTFILES_DIR
git -C $DOTFILES_DIR submodule update --init --recursive

# Install softlinks
$DOTFILES_DIR/install

# Install shell extras
echo 'source ~/.sh_rc' >> ~/.zshrc

# Make a directory to store code projects
mkdir -p ~/code

# Install "alex" to lint for considerate writing
sudo npm install alex --global

# Install gitree for viewing git repos in tree form.
sudo npm install @jpwilliams/gitree --global

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

# Make alt-tab work across workspaces.
gsettings set org.gnome.shell.window-switcher current-workspace-only true

# Get rid of login lock after 3 failed attempts:
# in /etc/security/faillock.conf, set `deny = 0` to disable the lockout.
# See https://wiki.archlinux.org/title/Security#Lock_out_user_after_three_failed_login_attempts

# Fix X apps unable to open firefox when in wayland:
# sudo nvim /usr/share/applications/firefox.desktop
# Change this:
# Exec=/usr/lib/firefox/firefox
# To this:
# Exec=env MOZ_DBUS_REMOTE=1 /usr/lib/firefox/firefox
# https://bugzilla.mozilla.org/show_bug.cgi?id=1508803
