#!/usr/bin/env bash

# If Mac 
if [ "$(uname)" == "Darwin" ]; then
    echo "I'm a Mac!"
    # Install hyperfine
    brew install hyperfine

# If Linux 
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo "I'm Linux!"
    # Install hyperfine
    wget https://github.com/sharkdp/hyperfine/releases/download/v1.11.0/hyperfine_1.11.0_amd64.deb
    sudo dpkg -i hyperfine_1.11.0_amd64.deb

# If Windows
elif [ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]; then
    echo "I'm Windows!"
fi
