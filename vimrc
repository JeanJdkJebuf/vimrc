set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"""""""""""
" SETTINGS
"""""""""""
" number of lines, left of the screen
set nu

" encoding utf-8
set encoding=utf-8

"split navigations
" ctrl + J = split below
nnoremap <C-J> <C-W><C-J>
" ctrl + k = split above
nnoremap <C-K> <C-W><C-K>
" ctrl + L = split right
nnoremap <C-L> <C-W><C-L>
" ctrl + H = split left
nnoremap <C-H> <C-W><C-H>

" proper python indentation
au BufNewFile,BufRead *.py |
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" full stack development
au BufNewFile,BufRead *.js, *.html, *.css |
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" Enable folding
set foldmethod=indent
set foldlevel=99

" activate mouse for all uses
set mouse=a

"function that changes colorscheme every 6 hours
"function SetTimeOfDayColors()
"	" colorscheme changing every 6 hours
"	let currentHour = strftime("%H")
"	echo "currentHour is " . currentHour . "h"
"	if currentHour < 6 + 0
"	     	let colorScheme = "darkblue"
"	elseif currentHour < 12 + 0
"		let colorScheme = "slate"
"	elseif currentHour < 18 + 0
"		let colorScheme = "desert"
"	else
"		let colorScheme = "ron"	
"	endif
"	echo "setting color scheme to " . colorScheme
"	execute "colorscheme " . colorScheme
"endfunction
"call SetTimeOfDayColors()

"colorscheme darkblue

" enables folding with spacebar when next to function you want to hide
nnoremap <space> za

" changes toolbar color
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

"Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" make your code looks cool
let python_highlight_all=1
syntax on

" Syntastic conf for html (W3)
let g:syntastic_html_checkers = ['w3']


"""""""""""""""
" VUNDLE PLUGIN
"""""""""""""""

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
" fresh vimrc config file

""""""""""""""""""""""""""""""""""""""""""""""
" VIM REQUIRED BUNDLES (so it's cool and stuff)
""""""""""""""""""""""""""""""""""""""""""""""

" NERDtree is a plugin that displays repo tree
Plugin 'scrooloose/nerdtree'
" opens automaticaly NERDtree when vim opens
autocmd vimenter * NERDTree
" closing nerdtree if no window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" NERDtree ignores some files to remove an error
let NERDTreeIgnore = ['\.DAT$', '\.LOG1$', '\.LOG1$']

" light and configurable statusline
" (bar at bottom)
Plugin 'itchyny/lightline.vim'

" Git commands in VIM
" for more infos, watch :
" http://vimcasts.org/episodes/fugitive-vim---a-complement-to-command-line-git/
" :Gblame annotations for each line of file
" :Gread revert current file to last checked in version
Plugin 'tpope/vim-fugitive'

"""""""""""""""""""""""""
" PYTHON SPECIFIC PLUGINS
"""""""""""""""""""""""""

" PEP8 indentation
Plugin 'vim-scripts/indentpython.vim'

" YMC (YouCompleteMe) --autocompletion tool
" needs to be compiled to work properly
" for more informations, watch 
" https://github.com/ycm-core/YouCompleteMe#mac-os-x-super-quick-installation
Bundle 'Valloric/YouCompleteMe' 

" Syntastic highlights code errors
Plugin 'vim-syntastic/syntastic'

"PEP8 checking (test as well)
Plugin 'nvie/vim-flake8'

""""""""""""""""""""""""""""
" PLUGINS FOR OTHER LANGAGES
""""""""""""""""""""""""""""

" For installation, watch installation for "linux-64bit link below
"https://github.com/ycm-core/YouCompleteMe

Plugin 'mattn/emmet-vim'
" :help emmet for reminder.
" here a quick example
" html:5 (space at end, then press C + y on space + keep C and press ,)
" div.foo>p#jor$*2 (. and # = id and class | > = inside | $ at the end means
" number (incremental, automatic) | *2 means number of p you want).

""""""""""""""""""""""""""""""""""""
" DO NOT ADD PLUGINS AFTER THIS LINE
""""""""""""""""""""""""""""""""""""

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

