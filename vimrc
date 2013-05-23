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
        set macmeta " enable macmeta for meta key mappings <M-?>
    endif
    colorscheme Tomorrow-Night-Eighties
else
    colorscheme slate
endif
" font
if (has("win32") || has("win64"))
    set guifont=Consolas:h11
endif

function! MakeDir(dir)
	if exists('*mkdir') && !isdirectory(a:dir)
		silent! call mkdir(a:dir, 'p')
    end
	return a:dir
endfunction

" Save backups to a less annoying place
if isdirectory(MakeDir($HOME . '/.vimbackup'))
    set backupdir=~/.vimbackup
else
    echom "Backup directory setup failed."
endif
set backup

" Save swaps to a less annoying place
if isdirectory(MakeDir($HOME . '/.vimswap'))
    set directory=~/.vimswap
else
    echom "Swap directory setup failed."
endif


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
set guicursor=n-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,v-i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
set selection=exclusive

" always show tabs in gvim, but not vim
set showtabline=2

" Format status line
set statusline=%7*\[%n]                                    " buffernr
set statusline+=%1*\ %<%f\                                 " File
if exists('g:loaded_fugitive')
    set statusline+=%{fugitive#statusline()}\              " Fugitive status
endif
set statusline+=%3*\ %y\                                   " FileType
set statusline+=%4*\ %{''.(&fenc!=''?&fenc:&enc).''}       " Encoding
set statusline+=%4*\ %{(&bomb?\",BOM\":\"\")}\             " Encoding2
set statusline+=%5*\ %{&ff}\                               " FileFormat (dos/unix..)
if exists('g:syntastic_check_on_open')
    set statusline+=%6*%{SyntasticStatuslineFlag()}        " Syntastic warning message
endif
if exists('g:tagbar_autofocus')
    set statusline+=%2*%{tagbar#currenttag('\ <%s>\ ','')} " Current tag
endif
set statusline+=%8*\ %m%r%w\                               " Modified? Readonly?
set statusline+=%=\ %-14.([%03b]\ [0x%04B]%)\              " Character under curdor
set statusline+=%0*%5l,%-3c\ ln:%-5L                       " Row,col ln:TotalLineNumber

" status line colors
hi User1 guifg=#ffdad8  guibg=#880c0e
hi User2 guifg=#000000  guibg=#F4905C
hi User3 guifg=#292b00  guibg=#f4f597
hi User4 guifg=#112605  guibg=#aefe7B
hi User5 guifg=#051d00  guibg=#7dcc7d
hi User6 guifg=#ffffff  guibg=#810085 gui=bold
hi User7 guifg=#ffffff  guibg=#880c0e gui=bold
hi User8 guifg=#ffffff  guibg=#5b7fbb
hi User0 guifg=#ffffff  guibg=#094afe

augroup startgroup
    " and show tab number in tab label
    au VimEnter * set guitablabel=%N)\ %M%t

    " autosave everything when losing focus, ignore warnings from untitled buffers
    au FocusLost * silent! wa
augroup END

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

" Use Space to select word
nnoremap <space> viw

set guioptions-=m
" Cursor movement in Insert mode
inoremap <A-h> <Left>
inoremap <A-l> <Right>
inoremap <A-j> <Down>
inoremap <A-k> <Up>
inoremap <M-h> <Left>
inoremap <M-l> <Right>
inoremap <M-j> <Down>
inoremap <M-k> <Up>
" Quickly quit Insert mode
inoremap <A-i> <Esc>
inoremap <M-i> <Esc>

" Quick split window navigation
nnoremap <A-h> <C-w>h
nnoremap <A-l> <C-w>l
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-q> :q<cr>
nnoremap <A-o> :only<cr>
nnoremap <M-h> <C-w>h
nnoremap <M-l> <C-w>l
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-q> :q<cr>
nnoremap <M-o> :only<cr>


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

