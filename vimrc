" File encoding"{{{
set encoding=utf8 
set ffs=unix,dos 
"}}}
"

"Deal with line wrapping"{{{
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
"}}}

"set modeline


set viminfo=%,'50,\"100,n~/.viminfo

"Autocd into current file location
autocmd BufEnter * lcd %:p:h

"source $VIMRUNTIME/cream/creamrc
"doautoall VimEnter



" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'ciaranm/inkpot'
Plugin 'gioele/vim-autoswap'
Plugin 'gmarik/Vundle.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'mihaifm/bufstop'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/vim-statline'
"Plugin 'shemerey/vim-indexer'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
"Plugin 'vim-scripts/FuzzyFinder'
"Plugin 'vim-scripts/L9'
"Plugin 'vim-scripts/project.tar.gz'
Plugin 'vim-scripts/scd.vim'
"lugin 'vim-scripts/colorsupport.vim'
"Plugin 'vim-scripts/mayansmoke'
"lugin 'vim-scripts/pyte'
Plugin 'flazz/vim-colorschemes'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
"Plugin 'xolox/vim-session'
Plugin 'embear/vim-localvimrc'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Add smyck colorscheme
colorscheme smyck
"colorscheme pyte
"colorscheme mayansmoke

" Plugin options
let g:localvimrc_persistent=1
let g:localvimrc_name="lvimrc"

" For easytag performance
let g:easytags_auto_highlight = 0
"Misc options"{{{
set backspace=indent,eol,start  " more powerful backspacing
set textwidth=160
set nrformats-=octal
set fdm=marker
set ruler
set showcmd
set wildmenu
"}}}

"Indent options {{{
set cindent
set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4
"}}}
"
" Syntax-specific stuff"{{{

let xml_use_xhtml=1

" Latex Suite stuff
let g:Tex_ViewRule_pdf = 'evince'
let g:Tex_DefaultTargetFormat = 'pdf'

" Java stuff
if has("autocmd")
       autocmd Filetype java setlocal omnifunc=javacomplete#Complete
endif 

" VHDL
if has("autocmd")
       autocmd Filetype vhdl  setlocal fdm=marker cms=\ --%s 
       let g:vhdl_indent_genportmap = 0
endif 

set gfn=Inconsolata

let g:xml_syntax_folding=1
"au FileType xml setlocal foldmethod=syntax
"au FileType jsp setlocal foldmethod=syntax
"}}}
