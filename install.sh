#!/bin/bash
# Install .dotfiles

# -- Import from other scripts -------------------------------------------------

source 'scripts/helpers/colors.sh'
source 'scripts/helpers/functions.sh'

# -- OSX- or Linux-Specific Setup ----------------------------------------------

if system_is_OSX; then

  source 'scripts/osx.sh'

elif system_is_linux; then

  source 'scripts/ubuntu.sh'

fi

# -- GIT -----------------------------------------------------------------------

if get_boolean_response "Do you want to install the Git configuration files?"; then
  ln -sf $HOME/.dotfiles/git/gitignore_global $HOME/.gitignore_global
  echo_item "Linked global .gitignore" "green"

  ln -sf $HOME/.dotfiles/git/gitconfig $HOME/.gitconfig
  echo_item "Linked gitconfig" "green"
else
  echo_item "Ignoring Git configuration" red
fi

echo ""

# -- Alacritty Setup ----------------------------------------------------------

if get_boolean_response "Do you want to install Alacritty?"; then
  echo_item "Installing Alacritty" "green"
  brew cask install alacritty;
else
  echo_item "Ignoring Alacritty Installation" red
fi

if get_boolean_response "Do you want to install Alacritty configuration file?"; then
  ln -sf $HOME/.dotfiles/alacritty/config.yml $HOME/.alacritty.yml
else
  echo_item "Ignoring Alacritty configuration" red
fi

# -- ZSH Setup -----------------------------------------------------------------

if exists "zsh"; then
  if get_boolean_response "Do you want to install ZSH configuration files?"; then

    # -- ZSHRC
    ln -sf $HOME/.dotfiles/zsh/zshrc $HOME/.zshrc
    echo_item "Linked zshrc" "green"

    # -- OH MY ZSH
    if [ -d $HOME/.oh-my-zsh/ ]; then
      echo_item "Oh my ZSH is already installed" "green"
    else
      if exists "curl"; then
        curl -L http://install.ohmyz.sh | sh
      elif exists "wget"; then
        wget --no-check-certificate http://install.ohmyz.sh -O - | sh
      else
        echo_item "You need either curl or wget installed to download Oh My ZSH"
      fi
    fi

  else
    echo_item "Ignoring ZSH configuration" "red"
  fi
else
  echo_item "ZSH is not installed"
fi

echo ""

# -- BASH Setup ----------------------------------------------------------------

if get_boolean_response "Do you want to install Bash configuration files?"; then
  # -- BASH PROFILE
  ln -sf $HOME/.dotfiles/bash/bash_profile $HOME/.bash_profile
  echo_item "Linked bash_profile" "green"
else
  echo_item "Ignoring Bash configuration" "red"
fi

echo ""

# -- TMUX ----------------------------------------------------------------------
if get_boolean_response "Do you want to install the Tmux configuration file?"; then
  ln -sf $HOME/.dotfiles/tmux/tmux.conf $HOME/.tmux.conf
  echo_item "Linked tmux configutation" "green"
else
  echo_item "Ignoring Tmux configuration" "red"
fi

echo ""

# -- Node ----------------------------------------------------------------------

if exists "nvm"; then
  echo_item "Node tools are already installed" green
else
  if get_boolean_response "Do you want to install Node Version Manager?"; then
    git clone https://github.com/creationix/nvm.git ~/.nvm && cd ~/.nvm && git checkout $(git describe --abbrev=0 --tags)
    . $HOME/.nvm/nvm.sh
    #nvm alias default system
    nvm install --lts
    npm install -g yarn
  else
    echo_item "Skipping Node.js tools install" red
  fi
fi

echo ""

# -- NEOVIM --------------------------------------------------------------------
# Link the dotfiles

if get_boolean_response "Do you want to install the Neovim configuration file?"; then
  ln -sf $HOME/.dotfiles/nvim/init.vim $HOME/.config/nvim/init.vim
  echo_item "Linked Neovim configuration" "green"
else
  echo_item "Ignoring Neovim configuration" red
fi

echo ""

# -- GCloud --------------------------------------------------------------------

if exists "gcloud"; then
  echo_item "GCloud is already installed" green
else
  if get_boolean_response "Do you want to install GCloud"; then
    curl https://sdk.cloud.google.com | bash
    echo_item "GCloud Installed" "green"
  else
    echo_item "Skipping GCloud install" red
  fi
fi
