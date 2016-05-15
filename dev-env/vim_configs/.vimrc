" NOTES:::
" SPLIT HORIZONTALLY:          <C-W><C-n>        ------pane1------
"                                                ------pane2------
"
" SPLIT VERTICALLY:            <C-W><C-v>   ::   | pane1 | pane2 |
"

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

"if has('vim_starting')
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
"""set runtimepath+=~/.vim/bundle/neobundle.vim/
"endif

" Required:
"set runtimepath^=~/.vim/bundle/neobundle.vim/

" Required:
"call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
"NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!

"call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 " NeoBundleCheck


set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

set noerrorbells
set novisualbell

" make statusbar appear all the time
set laststatus=2

" Start searching before pressing enter
set incsearch

" put all swap and backup files in the same directory - away from working directory
set backupdir=~/.vim/backup_files//
set directory=~/.vim/swap_files//
set undodir=~/.vim/undo_files//

" previous colour scheme of choice
colorscheme evening 

" highlight options for search
set hlsearch
hi Search cterm=underline gui=underline ctermfg=Magenta ctermbg=Blue guibg=Blue guifg=LightBlue

highlight Comment cterm=underline gui=underline ctermbg=Magenta ctermfg=White guifg=Magenta guibg=Magenta
highlight Search cterm=underline gui=underline ctermbg=Magenta ctermfg=White guifg=Magenta guibg=Magenta
highlight Normal cterm=underline gui=underline ctermbg=Black ctermfg=White guibg=Magenta guifg=Blue

" ignore case when searching
set ignorecase

set noet sts=0 sw=4 ts=4
set cindent
set cinoptions=(0,u0,U0


" set <leader> to "-"
let mapleader = "\<Space>"
nmap <Space> <leader>
" let mapleader=" "

nnoremap <Space> <Nop>

" start with NERDTree visible
" autocmd VimEnter * NERDTree



"################################################################################
"#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ SETKEYS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"################################################################################

" <LEADER>w  saves current file    (<SPACE>sb ?) 
nnoremap <Leader>w :w<CR>

" <CTRL-w>30 indents 30 spaces from the left edge
nnoremap <C-w>30 A<space><esc>30A<space><esc>d30<bar>i
 
" <CTRL--b> creates a sort of 'header'
"nnoremap <C-b> :center 80<cr>hhv0r~i#<esc>A<space><esc>40A~<esc>d80<bar>YppVr#kk.0i//<esc>j0i//<esc>j0i//<esc>0ji
nnoremap <C-b> :center 80<cr>hhv0r~i#<esc>A<space><esc>40A~<esc>d80<bar>YppVr#kk.

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab


" <CTRL-w>b inserts 'footer'
nnoremap <C-w>b <esc>81A#<esc><bar>0i//<esc>j0i
" nnoremap <C-w>b <esc>81A#<esc><bar>0i//<esc>j0i


" <leader>sb toggles scrollbar on and off
map <leader>sb :call ToggleScrollbar()<cr>

" ctrl-N ctrl-N toggles line numbers
nmap <C-N><C-N> :set invnumber<CR>

"paste text unmodified from other applications
nnoremap <F2> :set invpaste paste?<CR>

" make the ctrl-shift-c copy used by vim act like regular ctrl-c
vmap <C-C> "+y

" ctrl-n now opens & closes NERDTree
map <C-n> :NERDTreeToggle<CR>

" use ; instead of :
" nnoremap ; :

" longest history ever :)
set history=1000

" lots of undo available
set undolevels=1000

" stop it from beeping - that's just annoying
set visualbell

"make statusbar give e.g. line numbers
set statusline=%<%m\ %f\ %y\ %{&ff}\ \%=\ row:%l\ of\ %L\ col:%c%V\ %P

"show bookmarks list when vim opens
let NERDTreeShowBookmarks=1

" make it show at least one line above/below the cursor
set scrolloff=1

" no word wrap
set nowrap

" Backspace through anything in insert mode
set backspace=indent,eol,start

" toggle paste mode, which preserves indents on paste
set pastetoggle=<F2>

set showmode

" show matching parentheses
set showmatch

set runtimepath^=~/.vim/bundle/node

" make filename appear at the bottom
set statusline+=%F

set nocompatible

syntax on
" filetype plugin indent on
" filetype plugin on

" filetype off

set fileformats=unix,dos
au BufRead,BufNewFile * if &l:modifiable | setlocal fileformat=unix | endif


"============================= VUNDLE AND PATHOGEN =========================="
set rtp+=~/.vim/bundle/Vundle.vim

call pathogen#infect()

" ******* ALL VUNDLE PLUGINS GO IN HERE ******* "
call vundle#begin()

    Plugin 'gmarik/Vundle.vim'
    Plugin 'moll/vim-node.vim'
    Plugin 'maksimr/vim-jsbeautify'
    Plugin 'einars/js-beautify'
    Plugin 'jelera/vim-javascript-syntax'
    Plugin 'elzr/vim-json'
    Plugin 'jimmyhchan/dustjs.vim'
    Plugin 'tpope/vim-fugitive'

call vundle#end()
"***********************************************"


"=========================================================================="




"======================================= NEOBUNDLE ======================================"
"Note: Skip initialization for vim-tiny or vim-small."
 if 0 | endif

 if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
   set runtimepath^=~/.vim/dein/

  " call dein#begin(expand('~/.cache/dein'))
  " call dein#add('~/.vim/dein/')
  " call dein#add('Shougo/neocomplete.vim')
  " call dein#end()

 endif

 " Required:
" call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
" NeoBundleFetch 'Shougo/neobundle.vim'

"    NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}

"    NeoBundle 'andfaulkner/gulp-babel-vim'
"	NeoBundle 'dhruvasagar/vim-table-mode'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!

" call neobundle#end()

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
" NeoBundleCheck
"======================================================================================



"====================================== SYNTASTIC =====================================

" syntastic settings for error checking
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1 
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" let g:syntastic_enable_signs=1
" let g:syntastic_auto_jump=1
" let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
" let g:syntastic_javascript_checkers = ['jshint']

"====================================================================================

" enable syntax
syntax enable

" settings for solarized colorscheme - set to off for now
" set background=dark
" colorscheme solarized

" File handling and settings
" -----------------------------------------------------------------------------

if !exists("autocommands_loaded")
  let autocommands_loaded = 1

  " Reload .vimrc after it or vimrc.local been saved
  au! BufWritePost .vimrc source %
  au! BufWritePost .vimrc.local source ~/.vimrc

  " File type settings on load
  au BufRead,BufNewFile *.scss set filetype=scss
  au BufRead,BufNewFile *.m*down set filetype=markdown
  au BufRead,BufNewFile *.as set filetype=actionscript
  au BufRead,BufNewFile *.json set filetype=json

  " Call the file type utility methods
  "au BufRead,BufNewFile *.txt call s:setWrapping()
  " au BufRead,BufNewFile *.md,*.markdown,*.mkd call s:setMarkdown()
  au BufRead,BufNewFile *.css,*.scss call s:setCSS()
  "au BufRead,BufNewFile *.html,*.js,*.haml,*.erb call s:setBrowserEnv()
  " au User Rails call s:setRails()

  " Reload all snippets when creating new ones.
  au! BufWritePost *.snippets call ReloadAllSnippets()

  " Enable autosave
  au FocusLost * :wa

  " Enable omnicomplete for supported filetypes
  autocmd FileType * if exists("+completefunc") && &completefunc == "" | setlocal completefunc=syntaxcomplete#Complete | endif
  autocmd FileType * if exists("+omnifunc") && &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif

endif


" make <C-w>f open npm module under cursor in new vertical split
autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif

" enable mouse
set mouse=a

" setup SyntaxComplete for every filetype that doesn't already have a language-specific OMNI script
    if has("autocmd") && exists("+omnifunc") 
autocmd Filetype * 
    \   if &omnifunc == "" | 
    \   setlocal omnifunc=syntaxcomplete#Complete | 
    \   endif 
    endif 


" Javascript code folding
au FileType javascript call JavaScriptFold()

" detect dustjs files, set type to dustjs
if has("autocmd")
  au  BufNewFile,BufRead *.dust,*.dustjs,*.tl set filetype=dustjs
endif
