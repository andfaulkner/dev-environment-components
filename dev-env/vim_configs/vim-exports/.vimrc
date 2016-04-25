set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
colorscheme evening 

" make it show at least one line above/below the cursor
set scrolloff=1

" Start searching before pressing enter
set incsearch

" Backspace through anything in insert mode
set backspace=indent,eol,start

"paste text unmodified from other applications
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

syntax on
filetype plugin indent on

set runtimepath^=~/.vim/bundle/node

" make filename appear at the bottom
set statusline+=%F
set laststatus=2

set nocompatible
filetype off



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
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

    NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!

 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck
"======================================================================================



"====================================== SYNTASTIC =====================================

 " syntastic settings for error checking
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1 
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_javascript_checkers = ['jshint']

"====================================================================================




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
  au BufRead,BufNewFile *.txt call s:setWrapping()
  au BufRead,BufNewFile *.md,*.markdown,*.mkd call s:setMarkdown()
  au BufRead,BufNewFile *.css,*.scss call s:setCSS()
  au BufRead,BufNewFile *.html,*.js,*.haml,*.erb call s:setBrowserEnv()
  au User Rails call s:setRails()

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
set mouse=a

filetype plugin indent on


" setup SyntaxComplete for every filetype that doesn't already have a language-specific OMNI script
    if has("autocmd") && exists("+omnifunc") 
autocmd Filetype * 
    \   if &omnifunc == "" | 
    \   setlocal omnifunc=syntaxcomplete#Complete | 
    \   endif 
    endif 


" Javascript code folding
au FileType javascript call JavaScriptFold()
