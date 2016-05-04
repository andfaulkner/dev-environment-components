#!/usr/bin/env bash

function unix_setup {
    touch ~/.bashrc
    touch ~/.bash_profile
    echo $MAIN_BASH_FILE
    #touch ~/"$MAIN_BASH_FILE"
    echo "unix"
}

function mac_setup {
    echo "mac"
    MAIN_BASH_FILE=".bash_profile"
    unix_setup
}

function linux_setup {
    echo "linux"
    MAIN_BASH_FILE=".bashrc"
    unix_setup
}

if [[ "$(uname)" == "Darwin" ]]; then
    mac_setup;
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
    linux_setup
elif [[ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]]; then
    echo "windoze"
fi

