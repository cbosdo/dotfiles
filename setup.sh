#!/bin/sh

# install fzf, exa, kitty, ripgrep
#sudo zypper -n install --no-recommends git-core nodejs19 neovim fish fzf fzf-fish-completion eza eza-fish-completion kitty ripgrep ripgrep-fish-completion bat rbenv

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
if test ! -e ~/.local/share/nvim/site/autoload/plug.vim; then
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi
ln -fs ${PWD}/nvim ~/.config
nvim -c "PlugInstall | :qa"

# Add +qa once https://github.com/neoclide/coc.nvim/issues/4377 is released
nvim +"CocInstall coc-eslint coc-git coc-jest coc-json coc-lists coc-pairs coc-pyright coc-snippets coc-tsserver | :qa"

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
    ln -ls ${PWD}/$bin ~/bin/$name
done

# fish
echo "Preparing fish..."
if test ! -L ~/.config/fish; then
    rm -rf ~/.config/fish
fi
ln -fs ${PWD}/fish ~/.config

if test ! -L ~/.config/omf; then
   rm -rf ~/.config/omf
fi
ln -fs ${PWD}/omf ~/.config
if test ! -e ~/.local/share/omf; then
    curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
fi

echo "Don't forget to change the default shell to fish!"
