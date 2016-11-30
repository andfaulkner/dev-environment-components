" Display the current column and row in the status bar
set ruler

" turn true colours on
set termguicolors

" always see at least one line above and below cursor unless at very top
" or bottom of file
set scrolloff=1

" automatically reload a file that has been changed outside vim (similar to
" how Sublime does it)
set autoread


"###########"""""""""""""""__PLUGINS__""""""""""""""""###########" 
" NeoBundle Scripts-----------------------------
if has('vim_starting')  
  set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
  set runtimepath+=~/.config/nvim/
endif

let neobundle_readme=expand('~/.config/nvim/bundle/neobundle.vim/README.md')

if !filereadable(neobundle_readme)  
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.config/nvim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.config/nvim/bundle/neobundle.vim/
  let g:not_finsh_neobundle = "yes"
endif

call neobundle#begin(expand('$HOME/.config/nvim/bundle'))  
NeoBundleFetch 'Shougo/neobundle.vim'

" -------------------------------------
" PLACE ALL NEOBUNDLE PLUGINS IN HERE
"
" a set of sane defaults for vim
NeoBundleFetch 'tpope/vim-sensible'
" do git in vim
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'tpope/vim-surround'
" apparently science says this is the most productive color scheme of all time
NeoBundle 'altercation/vim-colors-solarized'
" vim statusbar / tabline with special awesomeness
NeoBundle 'bling/vim-airline'
" semi-GUI for filesystem handling
NeoBundle 'scrooloose/nerdtree'

" fuzzy-search code completion. Painful to install, but totally essential
NeoBundle 'Valloric/YouCompleteMe', {  
     \ 'build'      : {
        \ 'mac'     : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'unix'    : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'windows' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'cygwin'  : './install.sh --clang-completer --system-libclang --omnisharp-completer'
        \ }
     \ }

"
" END NEOBUNDLE PLUGINS
" -------------------------------------

call neobundle#end()  
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck  
"End NeoBundle Scripts-------------------------


"#########################_END PLUGINS_##########################" 


"#### SET COLOR SCHEME ####
syntax enable
set background=dark
colorscheme solarized






