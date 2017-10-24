set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'luochen1990/rainbow'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'baskerville/bubblegum'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'vim-syntastic/syntastic'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on
filetype on
filetype plugin indent on

au VimEnter * call s:PluginSetup()

map <C-c> "+y
map <C-x> "*y
map <C-S-v> "+p

function! s:PluginSetup()
  let g:airline_theme = 'molokai'
  let g:airline_powerline_fonts = 1
  let g:airline_inactive_collapse = 0
  let g:airline_skip_empty_sections = 0
  let g:airline#extensions#ctrlp#show_adjacent_modes = 1
  let g:airline_detect_modified=1

  let g:javascript_plugin_jsdoc = 1
  let g:javascript_plugin_ngdoc = 1

  let g:jsx_ext_required = 0

  let g:rainbow_active = 1

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_javascript_checkers = ['eslint']
  let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'
  " autofix with eslint
  let g:syntastic_javascript_eslint_args = ''

  if exists('g:loaded_gitgutter')
    let g:gitgutter_override_sign_column_highlight = 0

    nmap <Leader>gp <Plug>GitGutterPreviewHunk
    nmap <Leader>gr <Plug>GitGutterUndoHunk:echomsg '\hr is deprecated. Use \hu'<CR>
    nmap <Leader>gu <Plug>GitGutterUndoHunk
    nmap <Leader>gs <Plug>GitGutterStageHunk
  endif

endfunction

set history=5000
set viminfo='1024,<0,s100,f0,r/tmp,r/mnt

" Appearance
colorscheme bubblegum-256-dark

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

" no swap
set noswapfile

" autoread
set autoread

" Sane defaults for tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
