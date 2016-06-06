#!/usr/bin/env bash

SNIPPETS_DIR=$(pwd | sed s/\\/snippets\\/.*/\\/snippets/g)





# THESE MUST RUN AFTER REGULAR UNIX SETUP
function unix_post_setup {
    vim +VundleInstall
}

function _gems_install_pry {
    gem install pry
    gem install pry-stack_explorer
    gem install hirb
    gem install pry-awesome_print
    gem install pry-macros
    gem install pry-theme
    gem install pry-rails
    if [[ $(ruby -v) = *"1.9"* ]]
    then
        gem install "pry-debugger"
    else
        gem install "pry-byebug"
    fi
    gem install pry-debugger
    gem install pry-rails
    gem install pry-coolline
}

function gems_ruby_debugging {
    gem install rspec
    gem install rspec-rails
    gem install factory_girl
    gem install factory_girl_rails
    gem install minitest
    gem install better_errors
    gem install ruby-progressbar
    gem install guard
    gem install guard-rspec
    gem install guard-rails
    gem install simplecov
    gem install rubocop
    gem install quiet_assets
    _gems_install_pry
}

function gems_frontend {
    gem install sass
    gem install nokogiri
    gem install jquery
    gem install jquery-rails
    gem install jquery-ui-rails
    gem install jquery-datatables-rails
    gem install client_side_validations
    gem install sass-rails
    gem install coffee-rails
    gem install compass
    gem install turbolinks
    gem install bootstrap-sass
    gem install uglifier
    gem install simple_form
}

function gems_web_servers {
    gem install rails
    gem install rack
    gem install thin
    gem install sinatra
    gem install puma
    gem install passenger
    gem install eventmachine
}

function gems_rest_api {
    gem install grape
    gem install multi_json
    gem install rabl
    gem install json
}

function gems_cli_utils {
    gem install thor
    gem install rake
    gem install shellwords
    gem install zeus
    gem install rerun
    gem install bundler
    gem install listen
    gem install columnize
}

function gems_security {
    gem install devise
    gem install oauth2
    gem install warden
    gem install cancancan
}

function gems_dbs {
    gem install pg
    gem install mysql2
    gem install redis
    gem install redis-rails
    gem install sqlite3
    gem install database_cleaner
    gem install squeel
}

function gems_scheduling {
    gem install ice_cube
    gem install daemons
    gem install delayed_job
}

function gems {
    gem install capistrano
    gem install mime-types
    gem install i18n
    gem install rubyzip
    gem install chronic
    gem install yard
    gem install racc
    gem install ruby-growl
    gem install dnssd -v "2.0.1"
    gems_scheduling 
    gems_dbs
    gems_web_servers
    gems_frontend
    gems_ruby_debugging
    gems_rest_api
    gems_cli_utils
    gems_security
}




#-----------------------------------------------------------------------------------------------------------------------------------------#
############################################### UNIX SETUP: COMMON TO BOTH MAC AND LINUX ##################################################
#-----------------------------------------------------------------------------------------------------------------------------------------#
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

     ############################ VIM SETUP NOTES - NEEDS REPAIR ###########################
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
     #######################################################################################

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
    curl http://www.vim.org/scripts/download_script.php?src_id=14455 > nerdcommenter.zip
    unzip nerdcommenter.zip -d ./nerdcommenter
    pushd ./
    mkdir ~/.vim/plugin
    mkdir ~/.vim/doc
    cd nerdcommenter
    mv doc/NERD_commenter.txt ~/.vim/doc/NERD_commenter.txt
    mv plugin/NERD_commenter.vim ~/.vim/plugin/NERD_commenter.vim

    # install vim rails and vim bundler
    pushd ./
    cd ~/.vim/bundle
    git clone git://github.com/tpope/vim-rails.git
    git clone git://github.com/tpope/vim-bundler.git
    popd

    ################################################################################
    #~~~~~~~~~~~~~~~~~~~ PYTHON PACKAGE MANAGER / INSTALLER SETUP ~~~~~~~~~~~~~~~~~~
    ################################################################################
    # GLOBAL PYTHON PACKAGE MANAGER
    wget https://bootstrap.pypa.io/get-pip.py
    sudo python ./get-pip.py
    pip install -U pip
    sudo pip install virtualenv
    
    # LOCAL PYTHON PACKAGE MANAGER
    wget https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py
    sudo python get-pipsi.py
    echo 'export PATH=$HOME/.local/bin:$PATH' >> $HOME/$MAIN_BASH_FILE 

    # simple filesystem watching
    pip install watch-fs

    unix_post_setup
}





#-----------------------------------------------------------------------------------------------------------------------------------------#
################################################################ MAC SETUP ################################################################
#-----------------------------------------------------------------------------------------------------------------------------------------#
function mac_setup { 
    echo "mac"1
    brew install shellcheck
    brew install the_silver_searcher
    MAIN_BASH_FILE=".bash_profile"
    brew install neovim/neovim/neovim
    brew cask install caskroom/versions/java7
    brew install gradle
    brew install ant

    # SHELL COMPLETIONS
    brew install bash-completion

    # wget
    brew install wget
   
    # python virtualenv
    brew install pyenv-virtualenv

    unix_setup
}





#-----------------------------------------------------------------------------------------------------------------------------------------#
############################################################### LINUX SETUP ###############################################################
#-----------------------------------------------------------------------------------------------------------------------------------------#
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
    sudo apt-get install shellcheck

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
    sudo apt-get install silversearcher-ag

    # SHELL COMPLETIONS
    sudo apt-get install bash-completion
    echo '[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion' >> ~/.bashrc


    # GET LATEST LUA
    lua > ~/Documents/.ERROR_OUTPUT_TEMP 2>&1; cat ~/Documents/.ERROR_OUTPUT_TEMP | head -2 | tail -1 | awk '{print $2}' | xargs sudo apt-get install

    # INSTALL REALPATH
    sudo apt-get install realpath

    unix_setup
}





#-----------------------------------------------------------------------------------------------------------------------------------------#
########################################################## DETERMINE CURRENT OS ###########################################################
#-----------------------------------------------------------------------------------------------------------------------------------------#
if [[ "$(uname)" == "Darwin" ]]; then
    mac_setup;
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
    linux_setup
elif [[ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]]; then
    echo "windoze";
fi

