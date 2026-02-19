#!/bin/bash

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


# Git and Github
brew install git
brew install gh

cp git/.gitconfig ~/.gitconfig
cp git/.gitignore ~/.gitignore


# GPG for Git Commit Sign
brew install gnupg
gpg --batch --generate-key <<EOF
Key-Type: RSA
Key-Length: 4096
Subkey-Type: RSA
Subkey-Length: 4096
Name-Real: $(git config user.name)
Name-Email: $(git config user.email)
Expire-Date: 0
%no-protection
EOF
fi

KEY_ID=$(gpg --list-secret-keys --keyid-format LONG | grep sec | cut -d'/' -f2 | cut -d' ' -f1)
git config --global user.signingkey $KEY_ID
git config --global commit.gpgSign true
echo '-------------------------------'
gpg --armor --export $KEY_ID
echo "Please copy it in https://github.com/settings/gpg/new \n"
echo "Press any key to continue..."
read -n 1 -s 

# Shell (zsh + oh my zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# TODO: oh my zsh


# Editors (VSCode, Cursor, Antigravity)
cp editor/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
cp editor/settings.json ~/Library/Application\ Support/Code/User/settings.json
cat editor/extensions.txt | xargs -n 1 code --install-extension

cp editor/keybindings.json ~/Library/Application\ Support/Cursor/User/keybindings.json
cp editor/settings.json ~/Library/Application\ Support/Cursor/User/settings.json
cat editor/extensions.txt | xargs -n 1 cursor --install-extension

cp editor/keybindings.json ~/Library/Application\ Support/Antigravity/User/keybindings.json
cp editor/settings.json ~/Library/Application\ Support/Antigravity/User/settings.json
cat editor/extensions.txt | xargs -n 1 antigravity --install-extension


# Terminal (Ghostty)
brew install --cask ghostty
cp ghostty/config ~/Library/Application\ /com.mitchellh.ghostty/config
