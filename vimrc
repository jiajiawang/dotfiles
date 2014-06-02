" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible               " be iMproved

" Vundle Config
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" My Plugins here:
Plugin 'Raimondi/delimitMate'
  let delimitMate_expand_space=1
  let delimitMate_expand_cr=1
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'SirVer/ultisnips'
  let g:UltiSnipsExpandTrigger="<C-l>"
  let g:UltiSnipsEditSplit="vertical"
  let g:UltiSnipsSnippetsDir="~/.vim/mycoolsnippets"
  let g:UltiSnipsSnippetDirectories=["UltiSnips", "mycoolsnippets"]
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
  nnoremap <f1> :NERDTreeToggle<cr>
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
  let g:ctrlp_clear_cache_on_exit = 0
Plugin 'ap/vim-css-color'
Plugin 'matchit.zip'
Plugin 'Align'
Plugin 'nathanaelkane/vim-indent-guides'
  let g:indent_guides_guide_size = 1
  let g:indent_guides_start_level = 2
Plugin 'altercation/vim-colors-solarized'
Plugin 'mattn/emmet-vim'
Plugin 'mileszs/ack.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'bling/vim-airline'
  let g:airline_left_sep=' '
  let g:airline_right_sep=' '
  let g:airline#extensions#tabline#enabled=1
  let g:airline#extensions#tabline#buffer_nr_show=1
Plugin 'othree/javascript-libraries-syntax.vim'
  let g:used_javascript_libs='jquery,angularjs'
Plugin 'moll/vim-node'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'myhere/vim-nodejs-complete'
  let g:nodejs_complete_config = {'js_compl_fn': 'javascriptcomplete#CompleteJS','max_node_compl_len': 15}
Plugin 'guileen/vim-node-dict'
  au FileType javascript set dictionary+=$HOME/.vim/bundle/vim-node-dict/dict/node.dict
Plugin 'pangloss/vim-javascript'
"Plugin 'vim-scripts/JavaScript-Indent'

"Plugins requires additional sources or installation steps
Plugin 'Valloric/YouCompleteMe'
  " sh bundle/youcompleteme/install.sh --clang-completer
Plugin 'majutsushi/tagbar'
  nnoremap <f2> :TagbarToggle<cr>
  " requirement: exuberant-ctags
  " if you want javascript support, you'll also need jsctags (https://github.com/mozilla/doctorjs)
  " article http://discontinuously.com/2011/03/vim-support-javascript-taglist-plus/
Plugin 'marijnh/tern_for_vim'
  " run npm install in 'bundle/tern_for_vim'

call vundle#end()
filetype plugin indent on     " required!
"
" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin command are not allowed..

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

set textwidth=80
set formatoptions=cq

set laststatus=2
set number
set ruler
set terse
set scrolloff=5

set complete+=k
set guicursor=n-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,v-i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
set selection=exclusive

" always show tabs in gvim, but not vim
"set showtabline=2

augroup startgroup
  "
  autocmd FileType perl,html,javascript,css,xml setlocal shiftwidth=4

  "omnifunc
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

  "
  au BufRead *.tmpl set filetype=html
  au BufRead *.html.erb set filetype=eruby.html

  " and show tab number in tab label
  au VimEnter * set guitablabel=%N)\ %M%t

  " autosave everything when losing focus, ignore warnings from untitled buffers
  au FocusLost * silent! wa

  " auto-update log file without confirmation and keep cursor at the bottom after update
  " convinient for monitoring log files
  au BufRead *.log setlocal autoread | normal G
  "au FileChangedShellPost *.log normal G

  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
  autocmd BufEnter * match OverLength /\%80v./

  autocmd FileType ruby let b:surround_45 = "do\n \r \nend"
augroup END

" Eclim
let g:EclimCompletionMethod = 'omnifunc'

set pastetoggle=<F3>

" mapping
let mapleader=","

" Auto format
map === mmgg=G`m^zz

" close all buffers
nmap <leader>D :bufdo bd<CR>

" Fast saving
nmap <leader>ww :w<cr>

" Center screen when scrolling search results
nmap n nzz
nmap N Nzz

" Map ESC
imap jj <ESC>

imap <C-K> <cr><Esc>O

" quick align
map <leader><leader>a :Align = , : => -><cr>

" Treat long lines as break lines
map j gj
map k gk

" Shifting blocks visually
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Use Space to scroll page
nnoremap <Space> 15<C-E>
nnoremap <S-Space> 15<C-Y>

set guioptions-=m

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

