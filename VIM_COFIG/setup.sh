#! /usr/bin/bash

USER_HOME=$(getent passwd ${SUDO_USER:-$USER} | cut -d: -f6)
OLD_VIMRC="${USER_HOME}/.vimrc"

# Check if the .vimrc file exists or not
if [ -e ${OLD_VIMRC} ]
then
    # .vimrc exists
    # rename .vimrc to .vimrc.backup
    if ! mv ${OLD_VIMRC} ${USER_HOME}/.vimrc.bak; then
        echo "Can't move old vimrc file !!"
        exit 1
    else
        # Copy the .vimrc from here to home folder
        cp $PWD/.vimrc ${USER_HOME}/
    fi
fi

