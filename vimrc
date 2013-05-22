" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible               " be iMproved

" Vundle Config
filetype off                   " required!

set rtp+=~/.vim/vundle.git/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'SirVer/ultisnips'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'skammer/vim-css-color'
Bundle 'matchit.zip'
Bundle 'Align'
Bundle 'ervandew/supertab'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'altercation/vim-colors-solarized'
Bundle 'mattn/zencoding-vim'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" Turn on syntax highlighting
syn on
" color scheme
set background=dark
if has("gui_running")
    if has("gui_macvim")
        set transparency=5
    endif
    colorscheme Tomorrow-Night-Eighties
else
    colorscheme slate
endif
" font
if (has("win32") || has("win64"))
    set guifont=Consolas:h11
endif

" Save backups to a less annoying place
if isdirectory($HOME . '/.vimbackup') == 0
  :silent !mkdir -p ~/.vimbackup >/dev/null 2>&1
endif
set backupdir=~/.vimbackup
set backup

" Save swaps to a less annoying place
if isdirectory($HOME . '/.vimswap') == 0
  :silent !mkdir -p ~/.vimswap >/dev/null 2>&1
endif
set directory=~/.vimswap


set backspace=indent,eol,start " allow backspacing over everything in insert mode
set showcmd                    " show incomplete cmds down the bottom
set showmode                   " show current mode down the bottom

set incsearch                  " find the next search as we type the search
set hlsearch                   " highlight searchs
set ignorecase                 " case insensitive search
set smartcase                  " case sensitive if a pattern contains an uppercase letter

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

set laststatus=2
set number
set ruler
set terse
set scrolloff=5

set complete-=i

" always show tabs in gvim, but not vim
" and show tab number in tab label
set showtabline=2
au VimEnter * set guitablabel=%N)\ %M%t

" autosave everything when losing focus, ignore warnings from untitled buffers
au FocusLost * silent! wa

" plugins' config
let g:ctrlp_clear_cache_on_exit = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.vim/mycoolsnippets"

" mapping
let mapleader=","

" quick align
map <leader><leader>a :Align = , : => -><cr>

nnoremap <f1> :NERDTreeToggle<cr>
nnoremap <f2> :TagbarToggle<cr>

" Shifting blocks visually
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" CTRL-X are Cut
vnoremap <C-X> "+x

" CTRL-C are Copy
vnoremap <C-C> "+y

" CTRL-V are Paste
map <C-V> "+gP
cmap <C-V> <C-R>+

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

