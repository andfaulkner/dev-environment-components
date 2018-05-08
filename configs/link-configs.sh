#!/usr/bin/env sh

####################################################################################################
#
# Run from root of snippets dir to link config files to the right locations
# 
####################################################################################################

__SNIPPETS_DIR__="$(pwd)"

#=== FUNCTION =================================================================
#        NAME:  symlink_ackrc
# DESCRIPTION:  Symlink .gitconfig & .ackrc files in snippets -> root dir
#               e.g. ~/.gitconfig
#==============================================================================
function symlink_configs {
    cd ~
    ln -s "$__SNIPPETS_DIR__/configs/.ackrc" ./.ackrc
    ln -s "$__SNIPPETS_DIR__/configs/.gitconfig" ./.gitconfig
    cd "$__SNIPPETS_DIR__"
}

function main {
    symlink_configs
}

main