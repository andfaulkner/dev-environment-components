#!/usr/bin/env bash

SNIPPETS_DIR=$(pwd | sed s/\\/snippets\\/.*/\\/snippets/g)

# THESE MUST RUN AFTER REGULAR UNIX SETUP
function unix_post_setup {
    vim +VundleInstall
}

function unix_setup {
    # MAKE ESSENTIAL BASH CONFIG FILES
    touch ~/.bashrc
    touch ~/.bash_profile
    echo "Main bash file: "$MAIN_BASH_FILE

    # Save snippets directory to main bash file
    sed -i "2 i\SNIPPETS_DIR=$SNIPPETS_DIR" ~/"$MAIN_BASH_FILE"
    # Add "manuals" to the path
    echo 'export PATH="$SNIPPETS_DIR/custom-manuals:$PATH"' >> ~/"$MAIN_BASH_FILE"
    echo "unix"
    ln -s "$SNIPPETS_DIR/dev-env/vim_configs/vim" ~/vim

    sudo apt-get install xclip

    ################################################################################
    #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ SCRIPTS LINKS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ################################################################################
    mkdir ~/scripts
    ln -s $SNIPPETS_DIR/dev-env/scripts/pry-utils $HOME/scripts/pry-utils
    ln -s $SNIPPETS_DIR/scripts/ruby $HOME/scripts/ruby
    ln -s $SNIPPETS_DIR/scripts/sh $HOME/scripts/sh
    ln -s $SNIPPETS_DIR/dev-env/vim_configs/vim $HOME/vim
    ln -s $SNIPPETS_DIR/dev-env/vim_configs/.vim $HOME/.vim
    ln -s $SNIPPETS_DIR/dev-env/vim_configs/.spf13-vim-3 $HOME/.spf13-vim
    ln -s $SNIPPETS_DIR/dev-env/vim_configs/.vim $HOME/.nvim 
    ln -s $SNIPPETS_DIR/dev-env/vim_configs/.vimrc $HOME/.nvimrc
    ln -s $HOME/.vimrc $HOME/.nvimrc
#lrwxrwxrwx    1 andrew     32 May 18 00:55 .vimrc -> /home/andrew/.spf13-vim-3/.vimrc
#lrwxrwxrwx    1 andrew     39 May 18 00:55 .vimrc.before -> /home/andrew/.spf13-vim-3/.vimrc.before
#-rw-r--r--    1 andrew   8859 May 11 23:36 .vimrc_BK_2016_05_11
#-rw-r--r--    1 andrew   9054 May 18 00:55 .vimrc__BK_2016_05_18
#lrwxrwxrwx    1 andrew     40 May 18 00:55 .vimrc.bundles -> /home/andrew/.spf13-vim-3/.vimrc.bundles
#lrwxrwxrwx    1 andrew     82 Apr 20 03:59 vim -> /home/andrew/.config/sublime-text-3/Packages/User/snippets/dev-env/vim_configs/vim
#drwxr-xr-x    2 andrew   4096 May 11 23:49 ~.vim
#lrwxrwxrwx    1 andrew     83 Apr 20 03:59 .vim -> /home/andrew/.config/sublime-text-3/Packages/User/snippets/dev-env/vim_configs/.vim
#lrwxrwxrwx    1 andrew     83 May 18 02:06 .nvim -> /home/andrew/.config/sublime-text-3/Packages/User/snippets/dev-env/vim_configs/.vim
#lrwxrwxrwx    1 andrew     19 May 18 02:25 .nvimrc -> /home/andrew/.vimrc




    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/scripts/git-completion.bash
    echo "source ~/scripts/git-completion.bash" >> ~/.bash_profile
    . ~/$MAIN_BASH_FILE
    ln -s $SNIPPETS_DIR/scripts ~/$

    ################################################################################
    #~~~~~~~~~~~~~~~~~~~~~ SUBLIME TEXT PACKAGE CONTROL INSTALL ~~~~~~~~~~~~~~~~~~~~
    ################################################################################
    cd  ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
    git clone git://github.com/wbond/sublime_package_control.git Package\ Control
    cd Package\ Control
    git checkout python3

    #link vimrc file
    mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
    ln -s ~/.vim $XDG_CONFIG_HOME/nvim
    ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim

    ################################################################################
    #~~~~~~~~~~~~~~~~~~~~~~~~~~~~ NVIM PLUGIN MANAGEMENT ~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ################################################################################
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    touch $HOME/.vimrc.bundles.local
    mkdir -p ~/.config/nvim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim

    ################################################################################
    #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ # VUNDLE FIXES ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ################################################################################
    touch ~/neobundleviminstall.sh
    curl https://gist.githubusercontent.com/killtheliterate/f33dbd455f86b4d093e9/raw/041b66bb3278eddf490a3819928d119cf5aeb0d5/install.sh > ~/neobundlenviminstall.sh
    rm ~/neobundleviminstall.sh

    # install nerdcommenter vim plugin
    curl http://www.vim.org/scripts/download_script.php?src_id=14455 > nerdcommenter.zip; unzip nerdcommenter.zip -d ./nerdcommenter; pushd ./; mkdir ~/.vim/plugin; mkdir ~/.vim/doc; cd nerdcommenter; mv doc/NERD_commenter.txt ~/.vim/doc/NERD_commenter.txt; mv plugin/NERD_commenter.vim ~/.vim/plugin/NERD_commenter.vim

    pushd ./
    cd ~/.vim/bundle
    git clone git://github.com/tpope/vim-rails.git
    git clone git://github.com/tpope/vim-bundler.git
    popd


    unix_post_setup
}

function mac_setup {
    echo "mac"
    MAIN_BASH_FILE=".bash_profile"
    brew install neovim/neovim/neovim
    brew cask install caskroom/versions/java7
    brew install gradle
    brew install ant

    # SHELL COMPLETIONS
    brew install bash-completion

    unix_setup
}

function linux_setup {
    echo "linux"
    MAIN_BASH_FILE=".bashrc"
    #install tmux
    #curl https://github.com/tmux/tmux/releases/download/2.2/tmux-2.2.tar.gz > ~/Downloads/tmux__2_2.zip
    #curl https://github.com/tmux/tmux/releases/download/2.2/tmux-2.2.tar.gz > `curl -sI https://github.com/tmux/tmux/releases/download/2.2/tmux-2.2.tar.gz | grep -oP '(?<=Location: )[^\s]+' | xargs basename | ruby -pe '$_=$_.to_s.split("filename%3D").last.split("&").first'
    unzip ~/Downloads/tmux__2.2.zip -d ~/Downloads/tmux
    pushd ./
    cd ~/Downloads/tmux
    sudo apt-get install sendmail

    #awesome vim - neovim
    sudo apt-get install software-properties-common
    sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
    sudo update-alternatives --config vi
    sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
    sudo update-alternatives --config vim
    sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
    sudo update-alternatives --config editor
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt-get update
    sudo apt-get install neovim

    # SHELL COMPLETIONS
    sudo apt-get install bash-completion
    echo '[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion' >> ~/.bashrc


    # GET LATEST LUA
    lua > ~/Documents/.ERROR_OUTPUT_TEMP 2>&1; cat ~/Documents/.ERROR_OUTPUT_TEMP | head -2 | tail -1 | awk '{print $2}' | xargs sudo apt-get install

    # INSTALL REALPATH
    sudo apt-get install realpath

    unix_setup
}

if [[ "$(uname)" == "Darwin" ]]; then
    mac_setup;
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
    linux_setup
elif [[ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]]; then
    echo "windoze";
fi

# git completions - first run only
