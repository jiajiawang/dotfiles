" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible               " be iMproved

call plug#begin('~/.vim/plugged')

" General Plugins
Plug 'Raimondi/delimitMate'
  let delimitMate_expand_space=1
  let delimitMate_expand_cr=1
  imap <C-B> <Plug>delimitMateS-Tab
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'Lokaltog/vim-easymotion'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
  let g:UltiSnipsExpandTrigger="<C-l>"
  let g:UltiSnipsEditSplit="vertical"
  let g:UltiSnipsSnippetsDir="~/.vim/mycoolsnippets"
  let g:UltiSnipsSnippetDirectories=["UltiSnips", "mycoolsnippets"]
  let g:UltiSnipsListSnippets="<C-f>"
Plug 'scrooloose/nerdcommenter'
  let g:NERDSpaceDelims=1
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  nnoremap <C-n> :NERDTreeToggle<cr>
Plug 'neomake/neomake', { 'on': 'Neomake' }
  let g:neomake_open_list = 1
  let g:neomake_scss_enabled_makers = ['scsslint']
  let g:neomake_scss_scsslint_maker = {
    \ 'exe': 'scss-lint',
    \ 'errorformat': '%f:%l [%t] %m'
  \ }
  let g:neomake_javascript_enabled_makers = ['eslint']
  let g:neomake_ruby_enabled_makers = ['mri', 'rubocop', 'reek']
  let g:neomake_rails_enabled_makers = ['mri', 'rubocop', 'reek']
  let g:neomake_error_sign = {'text': '⛔️', 'texthl': 'NeomakeErrorSign'}
  let g:neomake_warning_sign = {'text': '⚠️', 'texthl': 'NeomakeWarningSign'}
  let g:neomake_message_sign = {'text': '👉', 'texthl': 'NeomakeMessageSign'}
  let g:neomake_info_sign = {'text': 'ℹ️', 'texthl': 'NeomakeInfoSign'}
Plug 'junegunn/fzf' | Plug 'junegunn/fzf.vim'
  nnoremap <C-p> :GFiles<cr>
  nnoremap <C-b> :Buffers<cr>
  nmap <leader><tab> <plug>(fzf-maps-n)
  xmap <leader><tab> <plug>(fzf-maps-x)
  omap <leader><tab> <plug>(fzf-maps-o)
  imap <c-x><c-k> <plug>(fzf-complete-word)
  imap <c-x><c-f> <plug>(fzf-complete-path)
  imap <c-x><c-j> <plug>(fzf-complete-file-ag)
  imap <c-x><c-l> <plug>(fzf-complete-line)
Plug 'kassio/neoterm'
  let g:neoterm_rspec_lib_cmd = 'bin/rspec'
  " let g:neoterm_run_tests_bg = 1
  nnoremap <silent> ,,, :Ttoggle<cr>
  nnoremap <silent> ,rt :call neoterm#test#run('all')<cr>
  nnoremap <silent> ,rf :call neoterm#test#run('file')<cr>
  nnoremap <silent> ,rn :call neoterm#test#run('current')<cr>
  nnoremap <silent> ,rr :call neoterm#test#rerun()<cr>
  set statusline+=%#NeotermTestRunning#%{neoterm#test#status('running')}%*
  set statusline+=%#NeotermTestSuccess#%{neoterm#test#status('success')}%*
  set statusline+=%#NeotermTestFailed#%{neoterm#test#status('failed')}%*
Plug 'eugen0329/vim-esearch'
  let g:esearch = {
    \ 'adapter':    'ag',
    \ 'backend':    'nvim',
    \ 'out':        'win',
    \ 'batch_size': 1000,
    \ 'use':        ['visual', 'hlsearch', 'last'],
    \}
Plug 'matchit.zip'
Plug 'Align'
Plug 'nathanaelkane/vim-indent-guides'
  " let g:indent_guides_guide_size = 1
  let g:indent_guides_start_level = 2
Plug 'altercation/vim-colors-solarized'
Plug 'mattn/emmet-vim'
  let g:user_emmet_settings = {
  \  'indentation' : '  ',
  \  'php' : {
  \    'indentation' : '    ',
  \  }
  \}
" Plug 'airblade/vim-gitgutter'
Plug 'sjl/gundo.vim'
  nnoremap <F5> :GundoToggle<CR>

" Plug 'edkolev/tmuxline.vim'
  " let g:tmuxline_powerline_separators=2
  " let g:tmuxline_theme = 'airline_insert'
  " let g:tmuxline_preset = {
      " \'a'    : '#S',
      " \'win'  : '#I #W',
      " \'cwin' : '#I #W',
      " \'x'    : '%a',
      " \'y'    : '%R %b %d',
      " \'z'    : '#H'}
Plug 'bling/vim-airline'
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
Plug 'vim-airline/vim-airline-themes'
Plug 'kana/vim-textobj-user'
Plug 'sjl/vitality.vim'
  let g:vitality_fix_cursor=0
  let g:vitality_always_assume_iterm = 1
Plug 'vim-scripts/closetag.vim'
Plug 'alvan/vim-closetag'
Plug 'christoomey/vim-tmux-navigator'
  " let g:tmux_navigator_save_on_switch=1
Plug 'rizzatti/dash.vim'
  nmap <silent> <leader>d <Plug>DashSearch

" Javascript Plugins
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
  let g:used_javascript_libs='jquery,angularjs,react,flux,chai'
Plug 'moll/vim-node'
" Plug 'jelera/vim-javascript-syntax'
Plug 'myhere/vim-nodejs-complete'
  let g:nodejs_complete_config = {'js_compl_fn': 'javascriptcomplete#CompleteJS','max_node_compl_len': 15}
Plug 'guileen/vim-node-dict'
  au FileType javascript set dictionary+=$HOME/.vim/bundle/vim-node-dict/dict/node.dict
Plug 'mxw/vim-jsx'
  let g:jsx_ext_required=0
Plug 'kchmck/vim-coffee-script'
Plug 'flowtype/vim-flow'
  let g:flow#enable=0

" CSS Plugins
Plug 'cakebaker/scss-syntax.vim'
Plug 'ap/vim-css-color'

" Ruby Plugins
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-cucumber'
Plug 'vim-ruby/vim-ruby'
  let g:rubycomplete_buffer_loading = 1
  let g:rubycomplete_classes_in_global = 1
  " let g:rubycomplete_rails = 1
  " let g:rubycomplete_load_gemfile = 1
  " let g:rubycomplete_use_bundler = 1
  let ruby_operators = 1
  let ruby_space_errors = 1
  " let ruby_fold = 1
Plug 'ecomba/vim-ruby-refactoring'
Plug 'slim-template/vim-slim'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'michaeljsmith/vim-indent-object'
Plug 'jiajiawang/vim-ruby-helper'
Plug 'jiajiawang/vim-rubocop'
Plug 'rainerborene/vim-reek'
  let g:reek_always_show = 0
  let g:reek_on_loading = 0

" go Plugins
Plug 'fatih/vim-go'

" C# Plugins
" Plug 'OmniSharp/omnisharp-vim'
  " let g:OmniSharp_selector_ui = 'ctrlp'

" Plug 'jeaye/color_coded'
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-easytags'
  " let g:easytags_auto_update = 0
  " let g:easytags_auto_highlight = 0
  " let g:easytags_dynamic_files = 1

"Plugins requires additional sources or installation steps
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
  let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
  let g:ycm_complete_in_strings=1
  let g:ycm_collect_identifiers_from_tags_files=1
  let g:ycm_seed_identifiers_with_syntax=1
" Plug 'majutsushi/tagbar'
  " nnoremap <f2> :TagbarToggle<cr>
  " requirement: exuberant-ctags
  " if you want javascript support, you'll also need jsctags (https://github.com/mozilla/doctorjs)
  " article http://discontinuously.com/2011/03/vim-support-javascript-taglist-plus/
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }

call plug#end()

filetype plugin indent on     " required!

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
let g:formatdef_fmt_custom_xml = '"tidy -xml -q --show-errors 0 --show-warnings 0 --indent-attributes 1"'
let g:formatters_xml = ['fmt_custom_xml']

augroup startgroup
  autocmd!
  autocmd! BufWritePost * Neomake
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
  autocmd BufEnter *.js match OverLengthOrExtraWhiteSpace /\%121v.\|\s\+\%#\@<!$/

  autocmd FileType ruby let b:surround_45 = "do\n\r\nend"
  autocmd FileType php let b:surround_63 = "<?php \r ?>"

  autocmd BufReadPost fugitive://* set bufhidden=delete
  " Don't screw up folds when inserting text that might affect them, until
  " leaving insert mode. Foldmethod is local to the window. Protect against
  " screwing up folding when switching between windows.
  autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
  autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
augroup END

augroup reload_vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

aug neoterm_test_rspec
  au VimEnter,BufRead,BufNewFile *_spec.rb,*_feature.rb call neoterm#test#libs#add('rspec')
  au VimEnter *
        \ if filereadable('spec/spec_helper.rb') |
        \   call neoterm#test#libs#add('rspec') |
        \ endif
aug END

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

" Beatify json file
nmap <leader>bfj :%!python -m json.tool<cr>

" Map ESC
imap jj <ESC>

imap <C-P> <cr><Esc>O

" quick align
map <leader><leader>a :Align = =>
map <leader>a: :Align :<cr>
map <leader>a> :Align =><cr>

" Treat long lines as break lines
map j gj
map k gk

" workaround for nvim vim-tmux-navigator issue
nmap <BS> <C-W>h
" if has('nvim')
  " nmap <BS> :<c-u>TmuxNavigateLeft<cr>
" endif

" Shifting blocks visually
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Use Space to scroll page
nnoremap <Space> 15<C-E>
nnoremap <S-Space> 15<C-Y>

nmap <leader>ss vi{:sort<cr>

" cmap W w !sudo tee % >/dev/null<CR>
"
imap <C-S-Space> <C-X><C-O>

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

