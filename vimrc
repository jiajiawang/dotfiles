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
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
  let g:UltiSnipsExpandTrigger="<C-j>"
  let g:UltiSnipsEditSplit="vertical"
  let g:UltiSnipsSnippetsDir="~/.vim/mycoolsnippets"
  let g:UltiSnipsSnippetDirectories=["UltiSnips", "mycoolsnippets"]
Bundle 'honza/vim-snippets'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
  nnoremap <f1> :NERDTreeToggle<cr>
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
  let g:ctrlp_clear_cache_on_exit = 0
" requirement: exuberant-ctags
" if you want javascript support, you'll also need jsctags (https://github.com/mozilla/doctorjs)
" article http://discontinuously.com/2011/03/vim-support-javascript-taglist-plus/
Bundle 'majutsushi/tagbar'
  nnoremap <f2> :TagbarToggle<cr>
Bundle 'ap/vim-css-color'
Bundle 'matchit.zip'
Bundle 'Align'
Bundle 'nathanaelkane/vim-indent-guides'
  let g:indent_guides_guide_size = 1
  let g:indent_guides_start_level = 2
Bundle 'altercation/vim-colors-solarized'
Bundle 'mattn/emmet-vim'
Bundle 'mileszs/ack.vim'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'bling/vim-airline'
  let g:airline_left_sep=' '
  let g:airline_right_sep=' '
  let g:airline#extensions#tabline#enabled=1
  let g:airline#extensions#tabline#buffer_nr_show=1
Bundle 'othree/javascript-libraries-syntax.vim'
  let g:used_javascript_libs='jquery,angularjs'
Bundle 'moll/vim-node'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'myhere/vim-nodejs-complete'
  let g:nodejs_complete_config = {'js_compl_fn': 'javascriptcomplete#CompleteJS','max_node_compl_len': 15}
" run npm install in 'bundle/tern_for_vim' after installed
Bundle 'marijnh/tern_for_vim'
Bundle 'guileen/vim-node-dict'
Bundle 'pangloss/vim-javascript'
Bundle 'vim-scripts/JavaScript-Indent'

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
set t_Co=256
set background=dark
color kolor
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1

" font
set guifont=Consolas:h11

" no backup and swap file
set nobackup
set noswapfile


set backspace=indent,eol,start " allow backspacing over everything in insert mode
set showcmd                    " show incomplete cmds down the bottom
set showmode                   " show current mode down the bottom

set incsearch                  " find the next search as we type the search
set hlsearch                   " highlight searchs
set ignorecase                 " case insensitive search
set smartcase                  " case sensitive if a pattern contains an uppercase letter

set smartindent
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=2
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
"set showtabline=2

augroup startgroup
  "
  autocmd FileType perl,html,javascript,css setlocal shiftwidth=4

  "omnifunc
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType javascript set dictionary+=$HOME/.vim/dict/node.dict
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

  "
  au BufRead *.tmpl set filetype=html
  au BufRead *.html.erb setfiletype eruby.html

  " and show tab number in tab label
  au VimEnter * set guitablabel=%N)\ %M%t

  " autosave everything when losing focus, ignore warnings from untitled buffers
  au FocusLost * silent! wa

  " auto-update log file without confirmation and keep cursor at the bottom after update
  " convinient for monitoring log files
  au BufRead *.log setlocal autoread | normal G
  "au FileChangedShellPost *.log normal G

augroup END

" plugins' config
"let g:SuperTabDefaultCompletionType="context"

" mapping
let mapleader=","

" Fast saving
nmap <leader>w :w<cr>

" quick align
map <leader><leader>a :Align = , : => -><cr>

" Treat long lines as break lines
map j gj
map k gk

" Shifting blocks visually
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Alt-X are Cut
vnoremap <A-x> "+x

" Alt-C are Copy
vnoremap <A-v> "+y

" Alt-V are Paste
map <A-v> "+gp
cmap <A-v> <C-R>+

" Use Ctrl-s for saving, also in Insert mode
noremap <C-s>		:update<CR>
vnoremap <C-s>		<C-C>:update<CR>
inoremap <C-s>		<C-O>:update<CR>

" Use Space to scroll page
nnoremap <Space> 15<C-E>
nnoremap <S-Space> 15<C-Y>

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

