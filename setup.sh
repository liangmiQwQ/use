#!/bin/bash

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


# Git and Github
brew install git
brew install gh

cp git/.gitconfig ~/.gitconfig
cp git/.gitignore ~/.gitignore

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
cp ghostty/config ~/Library/Application\ Support/com.mitchellh.ghostty/config
