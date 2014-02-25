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
  let g:UltiSnipsExpandTrigger="<C-j>"
  let g:UltiSnipsEditSplit="vertical"
  let g:UltiSnipsSnippetsDir="~/.vim/mycoolsnippets"
  let g:UltiSnipsSnippetDirectories=["UltiSnips", "mycoolsnippets"]
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
"Bundle 'skammer/vim-css-color'
Bundle 'ap/vim-css-color'
Bundle 'matchit.zip'
Bundle 'Align'
"Bundle 'fholgado/minibufexpl.vim'
  "let g:miniBufExplMinSize=2
  "nnoremap <f3> :MBEToggle<cr>
  "nnoremap <leader>bf :MBEbf<cr>
  "nnoremap <leader>bb :MBEbb<cr>
  "nnoremap <leader>bp :MBEbp<cr>
  "nnoremap <leader>bn :MBEbn<cr>
  "nnoremap <leader>mb :MBEFocus<cr>
"Bundle 'ervandew/supertab'
Bundle 'nathanaelkane/vim-indent-guides'
  let g:indent_guides_guide_size = 1
  let g:indent_guides_start_level = 2
Bundle 'altercation/vim-colors-solarized'
"Bundle 'mattn/zencoding-vim'
Bundle 'mattn/emmet-vim'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'mileszs/ack.vim'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'bling/vim-airline'
  let g:airline_left_sep=' '
  let g:airline_right_sep=' '
  let g:airline#extensions#tabline#enabled=1
  let g:airline#extensions#tabline#buffer_nr_show=1
Bundle 'othree/javascript-libraries-syntax.vim'
  let g:used_javascript_libs='jquery,angularjs'

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
color kolor
set background=dark
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

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
"let g:neocomplcache_dictionary_filetype_lists = { 'default' : '' }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
