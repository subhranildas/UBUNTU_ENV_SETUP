#!/bin/bash

USER_HOME=$(getent passwd ${SUDO_USER:-$USER} | cut -d: -f6)
OLD_VIMRC="${USER_HOME}/.vimrc"
NEW_VIMRC="$PWD/.vimrc"

# Check if the .vimrc file exists or not
if [ -e ${OLD_VIMRC} ]
then
    echo "<-> Existing vimrc found !!"
    # .vimrc exists
    if cmp -s "$NEW_VIMRC" "$OLD_VIMRC"; then
        echo "<-> Same vimrc !! Replacement not Required !!"
    else
        # Rename old .vimrc to .vimrc.bak
        echo "<-> Backing up old vimrc !!"
        if ! mv ${OLD_VIMRC} ${USER_HOME}/.vimrc.bak; then
            echo "<-> Can't move old vimrc file !!"
            exit 1
        else
            echo "<-> Adding new vimrc to user HOME !!"
            # Copy the .vimrc from here to user home folder
            cp ${NEW_VIMRC} ${USER_HOME}/
        fi
    fi
else
    echo "<-> No existing vimrc !!"
    echo "<-> Adding vimrc file to user HOME !!"
    # Copy the .vimrc from here to user home folder
    cp ${NEW_VIMRC} ${USER_HOME}/
fi

echo "Done !!"

