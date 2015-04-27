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

"set viminfo=%,'50,\"100,n~/.viminfo

"Autocd into current file location
"autocmd BufEnter * lcd %:p:h
command! Clcd lcd %:p:h


function! DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction

command! DeleteHiddenBuffers call DeleteHiddenBuffers()
"doautoall VimEnter




"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/home/john/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/home/john/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'


"" You can specify revision/branch/tag.
"NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

"NeoBundle 'shemerey/vim-indexer'
"NeoBundle 'jiangmiao/auto-pairs'
"NeoBundle 'vim-scripts/Briofita'

"Colorschemes
NeoBundle 'vim-scripts/ScrollColors'

NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'blerins/flattown'
NeoBundle 'w0ng/vim-hybrid'
 
NeoBundle 'ciaranm/securemodelines'
NeoBundle 'Chiel92/vim-autoformat'
NeoBundle 'embear/vim-localvimrc'
NeoBundle 'gioele/vim-autoswap'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'mihaifm/bufstop'

"NeoBundle 'scrooloose/nerdcommenter'
"NeoBundle 'scrooloose/nerdtree'
"NeoBundle 'scrooloose/vim-statline'
 
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'tpope/vim-surround'

NeoBundle 'pavoljuhas/scd.vim'

"Bling
NeoBundle 'bling/vim-airline'
NeoBundle 'mkitt/tabline.vim'

"Python syntax stuff
NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'hdima/python-syntax'
NeoBundle 'tmhedberg/SimpylFold'

"Autocomplete
NeoBundle 'davidhalter/jedi-vim'
"NeoBundle 'myint/clang-complete'

"Outlining
NeoBundle 'vimoutliner/vimoutliner.git'
NeoBundle 'majutsushi/tagbar'

"Unite stuff
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neossh.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vinarise.vim'

NeoBundle 'osyo-manga/vim-reunions'
NeoBundle 'osyo-manga/vim-marching'



NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-easytags'
NeoBundle 'xolox/vim-session'
"NeoBundle 'nicoraffo/conque'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck




" Plugin options"{{{

" Airline"{{{
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
"let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
 "}}}

" Lvimrc"{{{
let g:localvimrc_persistent=1
let g:localvimrc_name="lvimrc"
"}}}

" Session"{{{
let g:session_autosave='yes'
let g:session_autoload='yes'
let g:session_autosave_periodic=20
"}}}

" Easytags"{{{
" For easytag performance
let g:easytags_auto_highlight=0
let g:easytags_async=1
"}}}

" Vimfiler"{{{
let g:vimfiler_as_default_explorer=1
let g:loaded_netrwPlugin=0
"}}}

" Jedi "{{{
let g:jedi#force_py_version = 3
let g:jedi#show_call_signatures = 1
"}}}

" Tagbar
let g:tagbar_left=1

" Neocomplete"{{{

" Jedi+Neocomplete
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:neocomplete#force_omni_input_patterns.python =
            \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
" alternative pattern: '\h\w*\|[^. \t]\.\w*'

"" Marching+Neocomplete.vim
"let g:marching_enable_neocomplete = 1
"
"let g:neocomplete#force_omni_input_patterns.c = 
"            \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
"let g:neocomplete#force_omni_input_patterns.cpp = 
"            \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'


let g:neocomplete#force_omni_input_patterns.c =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#force_omni_input_patterns.objc =
      \ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)'
let g:neocomplete#force_omni_input_patterns.objcpp =
      \ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)\|\h\w*::\w*'
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_default_keymappings = 0
"let g:clang_use_library = 1



"}}}
"}}}
"
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
let g:python_highlight_all=1
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

" Colorschemes
colorscheme jelleybeans
"colorscheme hybrid
"colorscheme Monokai-chris 
"colorscheme smyck

" Alt-# to go to tab
noremap <M-1> 1gt
noremap <M-2> 2gt
noremap <M-3> 3gt
noremap <M-4> 4gt
noremap <M-5> 5gt
noremap <M-6> 6gt
noremap <M-7> 7gt
noremap <M-8> 8gt
noremap <M-9> 9gt
noremap <M-0> 10gt

"Ctrl-V for paste
imap <C-V> <ESC>"+pi

" Let ctrl-\ jump to tag in vsplit
nmap <C-\> :vsplit<CR>:let word=expand("<cword>")<CR><C-W><C-W>:exec "tag" word<CR>
inoremap <C-Space> <C-x><C-o>

" Tagbar
nmap <F8> :TagbarToggle<CR>

" NeoMRU
nmap <F2> :Unite neomru/file<CR>i
nmap <F3> :Unite neomru/directory<CR>i

