#!/bin/bash

source /vagrant/git_variables.sh

if [[ ! -z $EMAIL ]]; then
    git config --global --replace-all user.email "$EMAIL"
fi

if [[ ! -z $NAME ]]; then
    git config --global --replace-all user.name "$NAME"
fi

if [[ ! -z $GERRIT_USERNAME ]]; then
    git config --global --replace-all gitreview.username "$GERRIT_USERNAME"
fi

if [[ ! -z $DEFAULT_EDITOR ]]; then
    # Optional, I just prefer vim for commit messages
    git config --global --replace-all core.editor "$DEFAULT_EDITOR"
fi
