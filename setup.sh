#!/bin/bash
set -e
set -u


# Xcode cli
xcode-select --install 2>/dev/null || echo "Xcode Command Line Tools 已安装"


# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


# Git and Github
brew install git
brew install gh

cp git/.gitconfig ~/.gitconfig
cp git/.gitignore ~/.gitignore


# Basic Directories
cd ~
mkdir code
mkdir video
mkdir game


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


# Python Development
brew install pyenv
pyenv install 3.13.0
pyenv global 3.13.0


# Golang Development
brew install go


# Shell (zsh + zim)
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
cp zsh/.zshrc ~/.zshrc
cp zsh/.zimrc ~/.zimrc


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


# Terminal (Ghostty, Kitty)
brew install --cask ghostty
cp ghostty/config ~/Library/Application\ /com.mitchellh.ghostty/config

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
cp -r kitty ~/.config/kitty


# JavaScript Development (fnm, Node, Bun, pnpm, yarn, global toolchains)
curl -o- https://fnm.vercel.app/install | bash
fnm install 24.12.0
corepack enable pnpm
curl -fsSL https://bun.sh/install | bash
pnpm add -g @antfu/ni @napi-rs/cli yarn vite-plus-cli opencode-ai live-server taze cspell


# Rust Development (Rustup, just, useful tools)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install cargo-binstall
cargo binstall just cargo-insta cargo-shear cargo-workspaces cargo-edit -y


# Vim (Neovim, language-services)
brew install neovim
pnpm add -g dockerfile-language-server-nodejs typescript-language-server vls vscode-langservers-extracted pyright @microsoft/compose-language-service @tailwindcss/language-server @vue/language-server

git clone https://github.com/liangmiQwQ/nvim-config ~/.config/nvim


# Docker
brew install docker
brew install docker-compose


# Others
brew install bat
