" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible               " be iMproved

call plug#begin('~/.vim/plugged')

" General Plugins
Plug 'jiajiawang/gfmt.nvim', {'do': 'go get github.com/jiajiawang/gfmt.nvim/src/gfmt'}
Plug 'machakann/vim-highlightedyank'
  let g:highlightedyank_highlight_duration=2000
  map y <Plug>(highlightedyank)
Plug 'jiangmiao/auto-pairs'
  let g:AutoPairsFlyMode = 1
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'Lokaltog/vim-easymotion'
  let g:EasyMotion_smartcase = 1
  nmap s <Plug>(easymotion-overwin-f)
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
  let g:UltiSnipsExpandTrigger="<C-l>"
  let g:UltiSnipsEditSplit="vertical"
  let g:UltiSnipsSnippetsDir="~/.vim/mycoolsnippets"
  let g:UltiSnipsSnippetDirectories=["UltiSnips", "mycoolsnippets"]
  let g:UltiSnipsListSnippets="<C-f>"
Plug 'scrooloose/nerdcommenter'
  let g:NERDSpaceDelims=1
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
  nnoremap <M-j> :NERDTreeToggle<cr>
  nnoremap <M-k> :NERDTreeFind<cr>
Plug 'neomake/neomake'
  " let g:neomake_verbose = 3
  let g:neomake_open_list = 1
  let g:neomake_scss_enabled_makers = ['scsslint', 'stylelint']
  let g:neomake_scss_scsslint_maker = {
    \ 'exe': 'scss-lint',
    \ 'args': ['-c', '.scss-style.yml'],
    \ 'errorformat': '%f:%l:%c [%t] %m'
  \ }
  let g:neomake_scss_stylelint_maker = {
    \ 'exe': 'stylelint',
    \ 'args': ['--no-color'],
    \ 'errorformat':
               \ '%+P%f,' .
               \ '%*\s%l:%c  %t  %m,' .
               \ '%-Q'
  \ }
  let g:neomake_ruby_fasterer_maker = {
    \ 'exe': 'fasterer',
    \ 'errorformat': '%m Occurred at lines: %l.'
  \ }
  let g:neomake_javascript_enabled_makers = ['eslint']
  let g:neomake_ruby_enabled_makers = ['mri', 'rubocop', 'reek', 'fasterer']
  let g:neomake_rails_enabled_makers = ['mri', 'rubocop', 'reek', 'fasterer']
  let g:neomake_sh_enabled_makers = ['shellcheck']
  let g:neomake_error_sign = {'text': '💩', 'texthl': 'NeomakeErrorSign'}
  let g:neomake_warning_sign = {'text': '😞', 'texthl': 'NekomakeWarningSign'}
  let g:neomake_message_sign = {'text': '👉', 'texthl': 'NeomakeMessageSign'}
  let g:neomake_info_sign = {'text': '💁', 'texthl': 'NeomakeInfoSign'}
Plug 'junegunn/limelight.vim'
  let g:limelight_conceal_ctermfg = 240  " Solarized Base1
  let g:limelight_conceal_guifg = '#8a8a8a'  " Solarized Base1
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
  let g:fzf_history_dir = '~/.fzf-history'
  let g:fzf_files_options =
    \ '--preview "(pygmentize {} || cat {}) 2> /dev/null | head -'.&lines.'"'
  nnoremap <C-p> :Files<cr>
  nnoremap <C-b> :Buffers<cr>
  nnoremap <C-g> :BLines<cr>
  nnoremap <A-l> :Ag<cr>
  nmap <C-s> :let @"=expand("%:t:r")<cr><C-p><Esc>pi
  nmap <C-f> :let @"=expand("<cfile>")<cr><C-p><Esc>pi
  nmap <leader><tab> <plug>(fzf-maps-n)
  xmap <leader><tab> <plug>(fzf-maps-x)
  omap <leader><tab> <plug>(fzf-maps-o)
  imap <c-x><c-k> <plug>(fzf-complete-word)
  " imap <c-x><c-f> <plug>(fzf-complete-path)
  " imap <c-x><c-j> <plug>(fzf-complete-file-ag)
  " imap <c-x><c-l> <plug>(fzf-complete-line)
  command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
  command! -bang -nargs=+ -complete=dir Rag call fzf#vim#ag_raw(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
Plug 'janko-m/vim-test'
  let test#strategy = "neoterm"
  nnoremap <silent> ,,, :Ttoggle<cr>
  nnoremap <silent> ,rt :TestSuite<CR>
  nnoremap <silent> ,rf :TestFile<CR>
  nnoremap <silent> ,rn :TestNearest<CR>
  nnoremap <silent> ,rr :TestLast<CR>
Plug 'kassio/neoterm'
  let g:neoterm_size="120"
  let g:neoterm_position="vertical"
  let g:neoterm_rspec_lib_cmd = 'bin/rspec'
  let g:neoterm_cucumber_lib_cmd = 'bin/cucumber'
  " let g:neoterm_run_tests_bg = 1
  " set statusline+=%#NeotermTestRunning#%{neoterm#test#status('running')}%*
  " set statusline+=%#NeotermTestSuccess#%{neoterm#test#status('success')}%*
  " set statusline+=%#NeotermTestFailed#%{neoterm#test#status('failed')}%*
Plug 'eugen0329/vim-esearch'
  let g:esearch = {
    \ 'adapter':    'ag',
    \ 'backend':    'nvim',
    \ 'out':        'win',
    \ 'batch_size': 1000,
    \ 'use':        ['visual', 'hlsearch', 'last'],
    \}
Plug 'vim-scripts/matchit.zip'
Plug 'vim-scripts/Align'
Plug 'nathanaelkane/vim-indent-guides'
  " let g:indent_guides_guide_size = 1
  let g:indent_guides_start_level = 2
Plug 'altercation/vim-colors-solarized'
Plug 'iCyMind/NeoSolarized'
Plug 'mattn/emmet-vim'
  let g:user_emmet_settings = {
  \  'indentation' : '  ',
  \  'php' : {
  \    'indentation' : '    ',
  \  }
  \}
Plug 'airblade/vim-gitgutter'
Plug 'sjl/gundo.vim'
  nnoremap <F5> :GundoToggle<CR>
Plug 'terryma/vim-multiple-cursors'

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
Plug 'roxma/vim-tmux-clipboard'
Plug 'christoomey/vim-tmux-navigator'
  " let g:tmux_navigator_save_on_switch=1
Plug 'rizzatti/dash.vim'
  nmap <silent> <leader>ds <Plug>DashSearch

" Javascript Plugins
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
  let g:used_javascript_libs='jquery,angularjs,react,flux,chai'
" Plug 'moll/vim-node'
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
Plug 'fatih/vim-go', { 'for': 'go' }
  let g:go_auto_sameids = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_build_constraints = 1
Plug 'zchee/deoplete-go', { 'do': 'make'}

" C# Plugins
" Plug 'OmniSharp/omnisharp-vim'
  " let g:OmniSharp_selector_ui = 'ctrlp'

" Plug 'jeaye/color_coded'
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-easytags'
  " let g:easytags_auto_update = 0
  " let g:easytags_auto_highlight = 0
  " let g:easytags_dynamic_files = 1

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
  " deoplete tab-complete
  if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
  endif
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
  inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<tab>"
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
  " let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
  " let g:ycm_complete_in_strings=1
  " let g:ycm_collect_identifiers_from_tags_files=1
  " let g:ycm_seed_identifiers_with_syntax=1
" Plug 'majutsushi/tagbar'
  " nnoremap <f2> :TagbarToggle<cr>
  " requirement: exuberant-ctags
  " if you want javascript support, you'll also need jsctags (https://github.com/mozilla/doctorjs)
  " article http://discontinuously.com/2011/03/vim-support-javascript-taglist-plus/
Plug 'marijnh/tern_for_vim', { 'do': 'npm install -g' }
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_request_timeout = 1
  let g:tern_show_signature_in_pum = 1
  let g:tern#command = ["tern"]
  let g:tern#arguments = ["--persistent"]
Plug 'carlitux/deoplete-ternjs'
" Plug 'wellle/tmux-complete.vim'
  " let g:tmuxcomplete#trigger = 'completefunc'
Plug 'sbdchd/neoformat'

call plug#end()

filetype plugin indent on     " required!

" Turn on syntax highlighting
syn on
" color scheme
" set t_Co=256
set termguicolors
set background=dark
color NeoSolarized
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1

" Disable mouse
set mouse=""

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
" set lcs=tab:->
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
" set selection=exclusive

set previewheight=20
set splitbelow
set splitright
set diffopt+=vertical,iwhite
set foldlevelstart=2

set inccommand="nosplit"
" always show tabs in gvim, but not vim
"set showtabline=2
let g:formatdef_fmt_custom_xml = '"tidy -xml -q --show-errors 0 --show-warnings 0 --indent-attributes 1"'
let g:formatters_xml = ['fmt_custom_xml']

augroup gofile
  autocmd!
  autocmd FileType go setlocal shiftwidth=4 noexpandtab
  autocmd FileType go nmap <Leader>gr <Plug>(go-run)
  autocmd FileType go nmap <Leader>gt <Plug>(go-test)
  autocmd FileType go nmap <Leader>gi <Plug>(go-info)
augroup END

aug neomaker
  au!
  au BufWritePost * Neomake
  au BufRead,BufNewFile,BufEnter *test.jsx,*test.js let b:neomake_javascript_enabled_makers=[]
aug END

augroup startgroup
  autocmd!
  autocmd VimEnter * command! -nargs=? -complete=file AllFiles :call fzf#vim#files(<q-args>, { 'source': 'ag --hidden -U -g ""' })
  " autocmd VimEnter * command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '', {'options': "--preview 'pygmentize $(cut -d: -f1 <<< {}) 2> /dev/null | head -$(($(cut -d: -f2 <<< {}) + 10)) | tail -n 21'"})
  autocmd VimEnter * command! -nargs=* -complete=file Commits :call fzf#vim#commits(fzf#wrap('commits',
    \ {'options': '--preview "echo {} | grep -o ''[a-f0-9]\{7\}'' | head -1 | xargs -I % sh -c ''git log -1 --stat --color=always %''"'}))
  "
  " autocmd FileType perl,html,css,xml setlocal shiftwidth=4
  autocmd FileType php,c setlocal shiftwidth=4

  "omnifunc
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  " autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType javascript setlocal omnifunc=tern#Complete
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
  " autocmd BufEnter * match OverLengthOrExtraWhiteSpace /\%81v.\|\s\+\%#\@<!$/
  autocmd BufEnter *.js match OverLengthOrExtraWhiteSpace /\%121v.\|\s\+\%#\@<!$/

  autocmd FileType ruby let b:surround_45 = "do\n\r\nend"
  autocmd FileType php let b:surround_63 = "<?php \r ?>"

  " autocmd BufReadPost fugitive://* set bufhidden=delete
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

" if executable('ag')
  " " Use Ag over Grep
  " set grepprg=ag\ --vimgrep\ --nogroup\ --nocolor
" endif

set pastetoggle=<F3>
let g:html_indent_tags = 'li\|p'

" mapping
let mapleader=","

" Auto format
map === mmgg=G`m^zz
nnoremap <leader>rtw :%s/\s\+$//e<CR>

" Fast saving/quit
nmap <leader>ww :w<cr>
nmap <leader>wa :wa<cr>
nmap <leader>qq :q<cr>
nmap <leader>wq :wq<cr>

nmap <leader>,r f,a<cr><Esc>
nmap <leader>,l tahr<cr>w
nmap <leader>,n tthr<cr>w
vmap <leader>ml ygvs<cr><C-R><S-"><ESC>
call textobj#user#plugin('context', {
\   'code': {
\     'pattern': 'context(.*)',
\     'select': ['ic', 'ac']
\   },
\ })
call textobj#user#plugin('attribute', {
\   'code': {
\     'pattern': '[a-zA-Z-]\+=\({[^=]*}\|"[^=]*"\)',
\     'select': ['iT', 'aT'],
\     'move-n': 'ta',
\     'move-p': 'tA',
\   },
\ })
call textobj#user#plugin('keyvalue', {
\   'code': {
\     'pattern': '\w\+: [^:]*\(,\|\>\)',
\     'move-n': 'tt',
\     'move-p': 'tT',
\   },
\ })
" call textobj#user#plugin('attributes', {
" \   'code': {
" \     'pattern': ['<\w\+\s', '/\?>'],
" \     'select-a': 'aa',
" \     'select-i': 'ia',
" \   },
" \ })

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

" Duplicate paragraph
nmap <leader>dp v$%<S-Y><S-P>

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
nnoremap <C-Space> 15<C-Y>

nmap <leader>ss vii:sort<cr>

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

tnoremap <Esc> <C-\><C-n>
