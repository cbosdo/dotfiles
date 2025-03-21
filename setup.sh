#!/bin/sh

# install fzf, exa, kitty, ripgrep
#sudo zypper -n install --no-recommends git-core nodejs22 neovim python311-neovim fish fzf fzf-fish-integration eza eza-fish-completion kitty ripgrep ripgrep-fish-completion bat rbenv yarn go1.21

mkdir -p ~/.config

# kitty
echo "Preparing kitty..."
if test ! -L ~/.config/kitty; then
    rm -rf ~/.config/kitty
fi
ln -fs ${PWD}/kitty ~/.config
if test ! -d ~/.config/kitty/kitty-themes; then
    git clone https://github.com/dexpota/kitty-themes/ ~/.config/kitty/kitty-themes
fi

# Neovim
echo "Preparing neovim..."
if test ! -L ~/.config/nvim; then
    rm -rf ~/.config/nvim/
fi
ln -fs ${PWD}/nvim ~/.config

# Git
echo "Preparing git..."
ln -fs ${PWD}/git/config ~/.gitconfig
ln -fs ${PWD}/git/ignore ~/.gitignore

# bat
echo "Preparing bat..."
if test ! -L  ~/.config/bat; then
    rm -rf ~/.config/bat
fi
ln -fs ${PWD}/bat ~/.config

# bin files
for bin in ${PWD}/bin/*; do
    echo "Adding $bin script..."
    name=`basename $bin`
    if test ! -L ~/bin/$name; then
        rm -rf ~/bin/$name
    fi
    ln -s $bin ~/bin/$name
done

# Installing oh-my-posh
curl -s https://ohmyposh.dev/install.sh | bash -s

# fish
echo "Preparing fish..."
if test ! -L ~/.config/fish; then
    rm -rf ~/.config/fish
fi
ln -fs ${PWD}/fish ~/.config

if test ! -e ~/.config/fish/functions/fisher.fish; then
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fi


echo "Don't forget to change the default shell to fish!"
