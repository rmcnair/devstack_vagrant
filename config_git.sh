#!/bin/bash

# Update these variables to set up your git config
EMAIL=""
NAME=""
# If you do not remember your Gerrit user name go to the settings page on
# gerrit to check it out (it is not your email address).
GERRIT_USERNAME=""
DEFAULT_EDITOR=""

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
    git config --global --replace-all core.editor vim
fi
