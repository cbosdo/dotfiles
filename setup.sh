#!/bin/sh

# install fzf, exa, kitty, ripgrep
sudo zypper -n install git-core neovim fish fzf fzf-fish-completion exa exa-fish-completion kitty kitty-fish-completion ripgrep ripgrep-fish-completion bat

mkdir -p ~/.config

# kitty
rm -rf ~/.config/kitty
ln -fs ${PWD}/kitty ~/.config
git clone https://github.com/dexpota/kitty-themes/ ~/.config/kitty/kitty-themes

# fish
rm -rf ~/.config/fish
ln -fs ${PWD}/fish ~/.config
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

# Neovim
ln -fs ${PWD}/nvim ~/.config
nvim -c "PlugInstall | :qa"
nvim -c "CocInstall coc-eslint coc-git coc-jest coc-json coc-lists coc-pairs coc-pyright coc-snippets coc-tsserver"

# Git
ln -fs ${PWD}/git/config ~/.gitconfig
ln -fs ${PWD}/git/ignore ~/.gitignore

# bat
ln -fs ${PWD}/bat ~/.config
