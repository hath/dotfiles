set nocompatible
syntax on
filetype on
filetype plugin indent on

set history=5000
set viminfo='1024,<0,s100,f0,r/tmp,r/mnt
" see :h last-position-jump

" Appearance
if has('gui_running')
    colorscheme gentooish
    hi StatusLine gui=NONE
    hi User1 gui=NONE
    hi User2 gui=NONE
    hi WildMenu gui=NONE
    if has('win32')
        "set guifont=Terminus:h12:w6
        set guifont=Consolas:h11:w6
    elseif has('mac')
        set guifont=Monaco:h14
    else
        set guifont=Consolas\ 14
    end
else
    colorscheme default
    set guifont=Consolas\ 12
endif
" Remove GUI menu and toolbar
set guioptions-=T
set guioptions-=m

" Disabled because of slow redraws
" if(has("gui_running"))
"     set cursorline
"     set cursorcolumn
" endif

set backspace=indent,eol,start
set ruler
set showcmd
set number
set wrap

" Search
set incsearch
set hls
set noignorecase

set splitright

" Sane defaults for tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
"set smartindent

set foldtext=FoldText()
if has("gui_running")
    set fillchars=fold:·
else
    set fillchars=fold:-
endif
set foldcolumn=0
set foldmethod=syntax
set foldlevelstart=1

set laststatus=2
set wildmenu

if has('balloon_eval')
    set noballooneval
endif
set ttyfast

" Bouncy parens
set showmatch

" Visual bells give me seizures
set t_vb=''

set nostartofline
"set nowrapscan

let g:loaded_alignmaps=1
let c_curly_error=1

set cmdheight=1

