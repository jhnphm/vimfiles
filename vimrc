" File encoding"{{{
set encoding=utf8 
set ffs=unix,dos 
"}}}

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
"autocmd BufEnter * lcd %:p:h
command! Clcd lcd %:p:h

"doautoall VimEnter



" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"Plugin 'shemerey/vim-indexer'
"Plugin 'vim-scripts/FuzzyFinder'
"Plugin 'vim-scripts/L9'
"Plugin 'vim-scripts/colorsupport.vim'
"Plugin 'vim-scripts/project.tar.gz'
"Plugin 'vim-scripts/pyte'
"Plugin 'xolox/vim-session'
"Plugin 'Rip-Rip/clang_complete'
"Plugin 'justmao945/vim-clang'
"Plugin 'jiangmiao/auto-pairs'
 
Plugin 'flazz/vim-colorschemes'
 
Plugin 'Chiel92/vim-autoformat'
Plugin 'embear/vim-localvimrc'
Plugin 'gioele/vim-autoswap'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'junegunn/vim-easy-align'
Plugin 'mihaifm/bufstop'
"Plugin 'scrooloose/nerdcommenter'
"Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/vim-statline'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'pavoljuhas/scd.vim'
Plugin 'bling/vim-airline'
Plugin 'davidhalter/jedi-vim'

"Plugin 'xolox/vim-easytags'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/neossh.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimfiler'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell'
Plugin 'Shougo/vinarise.vim'

Plugin 'osyo-manga/vim-reunions'
Plugin 'osyo-manga/vim-marching'

Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
"Plugin 'nicoraffo/conque'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

colorscheme jelleybeans
"colorscheme pyte
"colorscheme mayansmoke
"colorscheme inkpot

"
" Plugin options
" 
let g:localvimrc_persistent=1
let g:localvimrc_name="lvimrc"
"let g:ycm_filetype_specific_completion_to_disable = { 'python' : 1 }
let g:session_autosave='yes'
let g:session_autoload='yes'
let g:session_autosave_periodic=20

" For easytag performance
let g:easytags_auto_highlight=0

" Vimfiler
let g:vimfiler_as_default_explorer=1
let g:loaded_netrwPlugin=0

" Jedi 
let g:jedi#force_py_version = 3

" Jedi+Neocomplete
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
"let g:neocomplete#force_omni_input_patterns.python =
            \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
" alternative pattern: '\h\w*\|[^. \t]\.\w*'

" Marching+Neocomplete.vim
let g:marching_enable_neocomplete = 1

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.c = 
            \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#force_omni_input_patterns.cpp = 
            \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'


"Misc options"{{{
set backspace=indent,eol,start  " more powerful backspacing
set textwidth=80
set nrformats-=octal
set fdm=marker
set ruler
set showcmd
set wildmenu
set nu
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

let g:xml_syntax_folding=1
"au FileType xml setlocal foldmethod=syntax
"au FileType jsp setlocal foldmethod=syntax
"}}}

" Gui stuff"{{{
set gfn=Inconsolata\ 11
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guioptions-=e  "remove tabline
set mousemodel=popup
"}}}

" Let ctrl-\ jump to tag in vsplit
nmap <C-\> :vsplit<CR>:let word=expand("<cword>")<CR><C-W><C-W>:exec "tag" word<CR>
inoremap <Nul> <C-x><C-o>


" Fix alt mappings in gnome-terminal
"let c='a'
"while c <= 'z'
"  exec "set <A-".c.">=\e".c
"  exec "imap \e".c." <A-".c.">"
"  let c = nr2char(1+char2nr(c))
"endw

"set ttimeout ttimeoutlen=10

