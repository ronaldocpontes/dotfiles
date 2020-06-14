#!/bin/sh

export DOTFILES_ENV=MacBook

# Configure OSX preferences
defaults write com.apple.finder AppleShowAllFiles TRUE

# heroku autocomplete setup
HEROKU_AC_BASH_SETUP_PATH=/Users/ronaldopontes/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;
