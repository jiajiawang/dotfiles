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

" General Plugins
Plugin 'Raimondi/delimitMate'
  let delimitMate_expand_space=1
  let delimitMate_expand_cr=1
  imap <C-B> <Plug>delimitMateS-Tab
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-dispatch'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'SirVer/ultisnips'
  let g:UltiSnipsExpandTrigger="<C-l>"
  let g:UltiSnipsEditSplit="vertical"
  let g:UltiSnipsSnippetsDir="~/.vim/mycoolsnippets"
  let g:UltiSnipsSnippetDirectories=["UltiSnips", "mycoolsnippets"]
  let g:UltiSnipsListSnippets="<C-f>"
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdcommenter'
  let g:NERDSpaceDelims=1
Plugin 'scrooloose/nerdtree'
  nnoremap <f1> :NERDTreeToggle<cr>
Plugin 'scrooloose/syntastic'
  " let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_html_tidy_exec = 'tidy5'
  let g:syntastic_javascript_checkers = ['eslint']
Plugin 'kien/ctrlp.vim'
  nnoremap <C-b> :CtrlPBuffer<cr>
Plugin 'matchit.zip'
Plugin 'Align'
Plugin 'nathanaelkane/vim-indent-guides'
  let g:indent_guides_guide_size = 1
  let g:indent_guides_start_level = 2
Plugin 'altercation/vim-colors-solarized'
Plugin 'mattn/emmet-vim'
  let g:user_emmet_settings = {
  \  'indentation' : '  ',
  \  'php' : {
  \    'indentation' : '    ',
  \  }
  \}
" Plugin 'airblade/vim-gitgutter'

" Plugin 'christoomey/vim-tmux-navigator'
  " let g:tmux_navigator_save_on_switch=1
" Plugin 'edkolev/tmuxline.vim'
  " let g:tmuxline_powerline_separators=2
  " let g:tmuxline_theme = 'airline_insert'
  " let g:tmuxline_preset = {
      " \'a'    : '#S',
      " \'win'  : '#I #W',
      " \'cwin' : '#I #W',
      " \'x'    : '%a',
      " \'y'    : '%R %b %d',
      " \'z'    : '#H'}
Plugin 'bling/vim-airline'
  let g:airline#extensions#tabline#enabled=1
  let g:airline#extensions#tabline#buffer_nr_show=1
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
Plugin 'kana/vim-textobj-user'
Plugin 'sjl/vitality.vim'
  let g:vitality_fix_cursor=0
  let g:vitality_always_assume_iterm = 1
Plugin 'vim-scripts/closetag.vim'

" Javascript Plugins
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
  let g:used_javascript_libs='jquery,angularjs,react'
Plugin 'moll/vim-node'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'myhere/vim-nodejs-complete'
  let g:nodejs_complete_config = {'js_compl_fn': 'javascriptcomplete#CompleteJS','max_node_compl_len': 15}
Plugin 'guileen/vim-node-dict'
  au FileType javascript set dictionary+=$HOME/.vim/bundle/vim-node-dict/dict/node.dict
Plugin 'mxw/vim-jsx'
  let g:jsx_ext_required=0
"Plugin 'vim-scripts/JavaScript-Indent'
Plugin 'kchmck/vim-coffee-script'

" CSS Plugins
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'ap/vim-css-color'

" Ruby Plugins
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'vim-ruby/vim-ruby'
  let g:rubycomplete_buffer_loading = 1
  let g:rubycomplete_classes_in_global = 1
  " let g:rubycomplete_rails = 1
  " let g:rubycomplete_load_gemfile = 1
  " let g:rubycomplete_use_bundler = 1
  let ruby_operators = 1
  let ruby_space_errors = 1
  " let ruby_fold = 1
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'slim-template/vim-slim'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'jiajiawang/vim-ruby-helper'
Plugin 'jiajiawang/vim-rubocop'
Plugin 'rainerborene/vim-reek'
  let g:reek_always_show = 0
  let g:reek_on_loading = 0
Plugin 'tpope/vim-cucumber'

" go Plugins
Plugin 'fatih/vim-go'

" C# Plugins
" Plugin 'OmniSharp/omnisharp-vim'
  " let g:OmniSharp_selector_ui = 'ctrlp'

" Plugin 'jeaye/color_coded'
" Plugin 'xolox/vim-misc'
" Plugin 'xolox/vim-easytags'
  " let g:easytags_auto_update = 0
  " let g:easytags_auto_highlight = 0
  " let g:easytags_dynamic_files = 1

"Plugins requires additional sources or installation steps
Plugin 'Valloric/YouCompleteMe'
  let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
  let g:ycm_complete_in_strings=1
  let g:ycm_collect_identifiers_from_tags_files=1
  let g:ycm_seed_identifiers_with_syntax=1
  " sh bundle/youcompleteme/install.sh --clang-completer --omnisharp-completer
" Plugin 'majutsushi/tagbar'
  " nnoremap <f2> :TagbarToggle<cr>
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
color solarized
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1

" font
set guifont=Ubuntu\ Mono:h11

" no backup and swap file
set nobackup
set noswapfile


set backspace=indent,eol,start " allow backspacing over everything in insert mode
set showcmd                    " show incomplete cmds down the bottom
set showmode                   " show current mode down the bottom

set cursorline
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
set lcs=tab:->
set list

set textwidth=80
set formatoptions=cq

set laststatus=2
set number
set ruler
set terse
set scrolloff=5

set tags+=./tags;
set complete+=k,]
set completeopt-=preview
set guicursor=n-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,v-i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
set selection=exclusive

set previewheight=20
set splitbelow
set splitright
set diffopt+=vertical,iwhite
set foldlevelstart=2

" always show tabs in gvim, but not vim
"set showtabline=2

augroup startgroup
  "
  " autocmd FileType perl,html,css,xml setlocal shiftwidth=4
  autocmd FileType php,c setlocal shiftwidth=4

  "omnifunc
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

  "
  au BufRead *.tmpl set filetype=html
  au BufRead *.phtml set filetype=php.html
  au BufRead *.html.erb set filetype=eruby.html
  au BufRead *.rb set filetype=ruby.rails

  " and show tab number in tab label
  " au VimEnter * set guitablabel=%N)\ %M%t

  " autosave everything when losing focus, ignore warnings from untitled buffers
  au FocusLost * silent! wa

  " auto-update log file without confirmation and keep cursor at the bottom after update
  " convinient for monitoring log files
  au BufRead *.log setlocal autoread | normal G
  "au FileChangedShellPost *.log normal G

  " autocmd BufEnter * highlight OverLength ctermbg=cyan guibg=cyan
  " autocmd BufEnter * highlight ExtraWhiteSpace ctermbg=cyan guibg=cyan
  autocmd BufEnter * highlight OverLengthOrExtraWhiteSpace ctermbg=cyan guibg=cyan
  " autocmd BufEnter * match OverLength /\%81v./
  " autocmd BufEnter * match ExtraWhiteSpace /\s\+\%#\@<!$/
  autocmd BufEnter * match OverLengthOrExtraWhiteSpace /\%81v.\|\s\+\%#\@<!$/

  autocmd FileType ruby let b:surround_45 = "do\n\r\nend"
  autocmd FileType php let b:surround_63 = "<?php \r ?>"

  autocmd BufReadPost fugitive://* set bufhidden=delete
  " Don't screw up folds when inserting text that might affect them, until
  " leaving insert mode. Foldmethod is local to the window. Protect against
  " screwing up folding when switching between windows.
  autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
  autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
augroup END

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --vimgrep\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  " let g:ctrlp_use_caching = 0
endif

" Eclim
" let g:EclimCompletionMethod = 'omnifunc'

set pastetoggle=<F3>
let g:html_indent_tags = 'li\|p'

" mapping
let mapleader=","

" Auto format
map === mmgg=G`m^zz
nnoremap <leader>rtw :%s/\s\+$//e<CR>

" close all buffers
nmap <leader>D :bufdo bd<CR>

" Fast saving
nmap <leader>ww :w<cr>

" Fast lnext, lprev
nmap <leader>lf :lfirst<cr>
nmap <leader>ln :lnext<cr>
nmap <leader>lp :lprev<cr>

" Fast cnext, cprev
nmap <leader>cf :cfirst<cr>
nmap <leader>cn :cnext<cr>
nmap <leader>cp :cprev<cr>

" Center screen when scrolling search results
nmap n nzz
nmap N Nzz

" Map ESC
imap jj <ESC>

imap <C-K> <cr><Esc>O

" quick align
map <leader><leader>a :Align = =>
map <leader>a: :Align :<cr>
map <leader>a> :Align =><cr>

" Treat long lines as break lines
map j gj
map k gk

" Shifting blocks visually
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Use Space to scroll page
nnoremap <Space> 15<C-E>
nnoremap <S-Space> 15<C-Y>

" cmap W w !sudo tee % >/dev/null<CR>

set guioptions-=m

" search for word under cursor
nnoremap * /<C-R><C-W><CR>
" grep for word under cursor and highlight
nnoremap & /<C-R><C-W><CR>:grep! "<C-R><C-W>"<CR>:cw<CR>
" search for selected text
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>
  \=substitute(escape(@", '"/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
" grep for selected text and highlight
vnoremap <silent> & :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>
  \=substitute(escape(@", '"/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \:grep! "<C-R><C-R>
  \=substitute(escape(@", '"/\.*$^~[]()'), '\_s\+', '\\s*\\n\\s*', 'g')<CR>"<CR>
  \:cw<CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

