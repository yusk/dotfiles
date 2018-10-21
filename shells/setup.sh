#!/bin/bash

# homebrew のインストール
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# app のインストール
brew cask install visual-studio-code
brew cask install homebrew/cask-versions/docker-edge
brew cask install slack

# anyenv
if [ ! -e ~/.anyenv ]; then
    git clone https://github.com/riywo/anyenv ~/.anyenv
    echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bash_profile
    echo 'eval "$(anyenv init -)"' >> ~/.bash_profile
    mkdir -p $(anyenv root)/plugins
    git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
    git clone https://github.com/znz/anyenv-git.git $(anyenv root)/plugins/anyenv-git
    source ~/.bash_profile

    # python
    anyenv install pyenv
    source ~/.bash_profile
    pyenv install 2.7.15
    pyenv install 3.6.6
    pyenv global 3.6.6

    # go
    anyenv install goenv
    source ~/.bash_profile
    goenv install 1.11.1
    goenv global 1.11.1
fi

# tool のインストール
if [ ! -f $(brew --prefix)/etc/bash_completion ]; then
    brew install bash-completion
    echo 'if [ -f $(brew --prefix)/etc/bash_completion ]; then' >> ~/.bash_profile
    echo '  . $(brew --prefix)/etc/bash_completion' >> ~/.bash_profile
    echo 'fi"' >> ~/.bash_profile
    # git のインストール
    brew install git
    echo 'source /usr/local/etc/bash_completion.d/git-prompt.sh' >> ~/.bash_profile
    echo 'source /usr/local/etc/bash_completion.d/git-completion.bash' >> ~/.bash_profile
fi

# ssh
ssh-keygen
