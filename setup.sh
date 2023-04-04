#!/bin/sh

# install fzf, exa, kitty, ripgrep
sudo zypper -n install --no-recommends git-core nodejs19 neovim fish fzf fzf-fish-completion exa exa-fish-completion kitty ripgrep ripgrep-fish-completion bat rbenv

mkdir -p ~/.config

# kitty
rm -rf ~/.config/kitty
ln -fs ${PWD}/kitty ~/.config
git clone https://github.com/dexpota/kitty-themes/ ~/.config/kitty/kitty-themes

# Neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
ln -fs ${PWD}/nvim ~/.config
nvim -c "PlugInstall | :qa"

# Add +qa once https://github.com/neoclide/coc.nvim/issues/4377 is released
nvim +"CocInstall coc-eslint coc-git coc-jest coc-json coc-lists coc-pairs coc-pyright coc-snippets coc-tsserver"

# Git
ln -fs ${PWD}/git/config ~/.gitconfig
ln -fs ${PWD}/git/ignore ~/.gitignore

# bat
ln -fs ${PWD}/bat ~/.config

# fish
rm -rf ~/.config/fish
ln -fs ${PWD}/fish ~/.config
rm -rf ~/.config/omf
ln -fs ${PWD}/omf ~/.config
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

echo "Don't forget to change the default shell to fish!"
