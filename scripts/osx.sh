#!/bin/bash
# OSX.sh

# -- Homebrew ------------------------------------------------------------------

if exists "brew"; then
  echo_item "Homebrew is already installed" green
else
  if get_boolean_response "Do you want to install Homebrew?"; then
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

    if get_boolean_response "Do you want to install shfmt"; then
      brew install shfmt
    else
      echo_item "Skipping shfmt" "red"
    fi
  else
    echo_item "Skipping Homebrew install" "red"
  fi
fi

echo ""

# -- rbenv ---------------------------------------------------------------------

if exists "rbenv"; then
  echo_item "rbenv is already installed" green
else
  if get_boolean_response "Do you want to install rbenv?"; then
    brew install rbenv ruby-install
    rbenv rehash
  else
    echo_item "Skipping rbenv install" red
  fi
fi

echo ""

# -- zsh -----------------------------------------------------------------------

if exists "zsh"; then
  echo_item "zsh is already installed" green
else
  if get_boolean_response "Do you want to install zsh?"; then
    brew install zsh
  else
    echo_item "Skipping zsh install" red
  fi
fi

echo ""

# -- Neovim --------------------------------------------------------------------

if exists "nvim"; then
  echo_item "Neovim is already installed" green
else
  if get_boolean_response "Do you want to install Neovim?"; then
    brew install --HEAD neovim
    curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    echo_item "Installing Vim Plug" green
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    nvim +PlugInstall +qa
  else
    echo_item "Skipping Neovim install" red
  fi
fi

# -- VSCODE -----------------------------------------------------------------------

if get_boolean_response "Do you want to install VS Code configuration files?"; then
  source 'vscode/install_plugins.sh'
  ln -sf $HOME/.dotfiles/vscode/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json
  ln -sf $HOME/.dotfiles/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
else
  echo_item "Ignoring VS Code configuration"
fi
