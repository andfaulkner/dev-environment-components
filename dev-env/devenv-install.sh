#!/usr/bin/env bash

SNIPPETS_DIR=$(pwd | sed s/\\/snippets\\/.*/\\/snippets/g)

function unix_setup {
    # install nerdcommenter vim plugin
    curl http://www.vim.org/scripts/download_script.php?src_id=14455 > nerdcommenter.zip; unzip nerdcommenter.zip -d ./nerdcommenter; pushd ./; mkdir ~/.vim/plugin; mkdir ~/.vim/doc; cd nerdcommenter; mv doc/NERD_commenter.txt ~/.vim/doc/NERD_commenter.txt; mv plugin/NERD_commenter.vim ~/.vim/plugin/NERD_commenter.vim
    touch ~/.bashrc
    touch ~/.bash_profile
    echo "Main bash file: "$MAIN_BASH_FILE
    # Save snippets directory to main bash file
    sed -i "2 i\SNIPPETS_DIR=$SNIPPETS_DIR" ~/"$MAIN_BASH_FILE"
    # Add "manuals" to the path
    echo 'export PATH="$SNIPPETS_DIR/custom-manuals:$PATH"' >> ~/"$MAIN_BASH_FILE"
    echo "unix"
    # ln -s "$SNIPPETS_DIR/dev-env/vim_configs/vim" ~/vim
}

function mac_setup {
    echo "mac"
    MAIN_BASH_FILE=".bash_profile"
    unix_setup
}

function linux_setup {
    echo "linux"
    MAIN_BASH_FILE=".bashrc"
    #install tmux
    #curl https://github.com/tmux/tmux/releases/download/2.2/tmux-2.2.tar.gz > ~/Downloads/tmux__2_2.zip
    
    curl https://github.com/tmux/tmux/releases/download/2.2/tmux-2.2.tar.gz > `curl -sI https://github.com/tmux/tmux/releases/download/2.2/tmux-2.2.tar.gz | grep -oP '(?<=Location: )[^\s]+' | xargs basename | ruby -pe '$_=$_.to_s.split("filename%3D").last.split("&").first'
    unzip ~/Downloads/tmux__2.2.zip -d ~/Downloads/tmux
    pushd ./
    cd ~/Downloads/tmux

    unix_setup
    sudo apt-get install sendmail
}

if [[ "$(uname)" == "Darwin" ]]; then
    mac_setup;
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
    linux_setup
elif [[ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]]; then
    echo "windoze"
fi

# git completions - first run only
# mkdir ~/scripts
# curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/scripts/git-completion.bash
# echo "source ~/scripts/git-completion.bash" >> ~/.bash_profile
# . ~/.bash_profile
