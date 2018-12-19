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
  " let g:AutoPairsMapCR = 0
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rhubarb'
Plug 'Lokaltog/vim-easymotion'
  let g:EasyMotion_smartcase = 1
  nmap t <Plug>(easymotion-overwin-f)
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
  let g:UltiSnipsExpandTrigger="<C-l>"
  let g:UltiSnipsEditSplit="vertical"
  let g:UltiSnipsSnippetsDir="~/.vim/mycoolsnippets"
  let g:UltiSnipsSnippetDirectories=["UltiSnips", "mycoolsnippets"]
  " let g:UltiSnipsListSnippets="<C-f>"
Plug 'scrooloose/nerdcommenter'
  let g:NERDSpaceDelims=1
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
  nnoremap <M-j> :NERDTreeToggle<cr>
  nnoremap <M-k> :NERDTreeFind<cr>
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'w0rp/ale'
  let g:airline#extensions#ale#enabled = 1
  let g:ale_open_list = 1
  let g:ale_sign_error = ''
  let g:ale_sign_warning = ''
  let g:ale_sign_info = ''
  let g:ale_lint_on_enter = 0
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_lint_on_insert_leave = 0
  let g:ale_lint_on_filetype_changed = 0
  let g:ale_linters = {
  \   'javascript': ['eslint'],
  \   'ruby': ['reek', 'rubocop', 'ruby'],
  \}
  let g:ale_fixers = {
  \   'javascript': ['eslint'],
  \}
  let g:ale_fix_on_save = 1
  let g:ale_emit_conflict_warnings = 0
Plug 'junegunn/limelight.vim'
  let g:limelight_conceal_ctermfg = 240  " Solarized Base1
  let g:limelight_conceal_guifg = '#8a8a8a'  " Solarized Base1
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
  let g:fzf_history_dir = '~/.fzf-history'
  let g:fzf_files_options =
    \ '--preview "bat --theme="OneHalfDark" --style=numbers,changes --color=always {} | head -'.&lines.'"'
  nnoremap <C-p> :Files<cr>
  nnoremap ; :Buffers<cr>
  nnoremap <C-g> :BLines<cr>
  nnoremap <A-l> :MyAg<cr>
  nmap <C-s> :let @"=expand("%:t:r")<cr><C-p><Esc>pi
  nmap <C-f> :let @"=expand("<cfile>")<cr><C-p><Esc>pi
  nmap <leader><tab> <plug>(fzf-maps-n)
  xmap <leader><tab> <plug>(fzf-maps-x)
  omap <leader><tab> <plug>(fzf-maps-o)
  " imap <leader><tab> <plug>(fzf-maps-i)
  imap <c-x><c-k> <plug>(fzf-complete-word)
  " imap <c-x><c-f> <plug>(fzf-complete-path)
  " imap <c-x><c-j> <plug>(fzf-complete-file-ag)
  " imap <c-x><c-l> <plug>(fzf-complete-line)
  command! -bang -nargs=* MyAg call fzf#vim#ag(<q-args>, {
    \ 'options': '--preview "linestart=\$(expr {+2} - 5); if [ \$linestart -lt 0 ]; then linestart=0; fi; lineend=\$(expr {+2} + 5); bat --theme="OneHalfDark" --style=numbers,changes --color=always --line-range \$linestart:\$lineend {+1}" --delimiter : --nth 4..'
    \ }, <bang>0)
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
  let g:neoterm_default_mod="vertical"
Plug 'eugen0329/vim-esearch'
  let g:esearch = {
    \ 'adapter':    'ag',
    \ 'backend':    'nvim',
    \ 'out':        'win',
    \ 'batch_size': 1000,
    \ 'use':        ['visual', 'hlsearch', 'last'],
    \}
Plug 'vim-scripts/matchit.zip'
Plug 'junegunn/vim-easy-align'
  vmap <Enter> <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)
Plug 'nathanaelkane/vim-indent-guides'
  " let g:indent_guides_guide_size = 1
  let g:indent_guides_start_level = 2
Plug 'altercation/vim-colors-solarized'
Plug 'iCyMind/NeoSolarized'
Plug 'morhetz/gruvbox'
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
Plug 'AndrewRadev/splitjoin.vim'
  let g:splitjoin_ruby_curly_braces = 0
aug javascript
  autocmd FileType javascript let b:splitjoin_trailing_comma=1
aug END
Plug 'svermeulen/vim-easyclip'
  let g:EasyClipAutoFormat = 1
  let g:EasyClipUsePasteToggleDefaults = 0
  let g:EasyClipUseSubstituteDefaults = 1
  nnoremap gm m
  nmap <c-b> <plug>EasyClipSwapPasteBackwards

" Auto completion
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " let g:deoplete#enable_at_startup = 1
  " inoremap <silent><expr> <TAB>
  " \ pumvisible() ? "\<C-n>" :
  " \ <SID>check_back_space() ? "\<TAB>" :
  " \ deoplete#mappings#manual_complete()
  " function! s:check_back_space() abort "{{{
  " let col = col('.') - 1
  " return !col || getline('.')[col - 1]  =~ '\s'
  " endfunction"}}}

Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
aug ncm2
  " enable ncm2 for all buffers
  autocmd BufEnter * call ncm2#enable_for_buffer()
aug END
set completeopt=noinsert,menuone,noselect
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-ultisnips'
Plug 'ncm2/ncm2-tern'
Plug 'ncm2/ncm2-tagprefix'

Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }
" let g:LanguageClient_loggingFile = '/tmp/lc.log'
" let g:LanguageClient_loggingLevel = 'DEBUG'

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
  " let g:airline#extensions#branch#enabled = 0
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
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''
Plug 'vim-airline/vim-airline-themes'
  let g:airline_theme='gruvbox'
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
Plug 'wellle/targets.vim'
function! s:pp_js(line)
 " Strip escape codes
 echom a:line
 return a:line
 " return substitute(a:line, "\<esc>".'\[\d\(\a\|\dm\)', '', 'g')
endfunction

Plug 'metakirby5/codi.vim'
  let g:codi#rightalign=0
  let g:codi#interpreters = {
            \ 'javascript': {
            \     'bin': 'node',
            \     'prompt': '^\(>\|\.\.\.\+\) ',
            \     'preprocess': function('s:pp_js'),
            \ },
       \ 'babel': {
           \ 'bin': ['npx', 'babel-node'],
           \ 'prompt': '^\(>\|\.\.\.\+\) ',
           \ },
       \ }

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
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
  let g:go_auto_sameids = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_build_constraints = 1
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }

" C# Plugins
" Plug 'OmniSharp/omnisharp-vim'
  " let g:OmniSharp_selector_ui = 'ctrlp'

" Plug 'jeaye/color_coded'
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-easytags'
  " let g:easytags_auto_update = 0
  " let g:easytags_auto_highlight = 0
  " let g:easytags_dynamic_files = 1

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
" Plug 'wellle/tmux-complete.vim'
  " let g:tmuxcomplete#trigger = 'completefunc'
Plug 'sbdchd/neoformat'
  nmap <leader>fo :Neoformat<cr>

call plug#end()

filetype plugin indent on     " required!

" Turn on syntax highlighting
syn on
" color scheme
" set t_Co=256
set termguicolors
set background=dark
" color NeoSolarized
color gruvbox
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
" set list

set textwidth=80
set formatoptions=cq

set laststatus=2
set number
set ruler
set terse
set scrolloff=5

set tags+=./tags;
set complete+=k,]
" set completeopt-=preview
" set guicursor=n-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,v-i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
" set selection=exclusive

set previewheight=20
set splitbelow
set splitright
set diffopt+=vertical,iwhite
set foldlevelstart=2

" set shortmess+=c

set inccommand=split
" always show tabs in gvim, but not vim
"set showtabline=2
let g:formatdef_fmt_custom_xml = '"tidy -xml -q --show-errors 0 --show-warnings 0 --indent-attributes 1"'
let g:formatters_xml = ['fmt_custom_xml']

augroup gofile
  autocmd!
  autocmd FileType go setlocal shiftwidth=2 tabstop=2 noexpandtab
  autocmd FileType go nmap <Leader>gr <Plug>(go-run)
  autocmd FileType go nmap <Leader>gt <Plug>(go-test)
  autocmd FileType go nmap <Leader>gin <Plug>(go-info)
  autocmd FileType go nmap <Leader>gim <Plug>(go-imports)
augroup END

augroup startgroup
  autocmd!
  autocmd VimEnter * command! -nargs=? -complete=file AllFiles :call fzf#vim#files(<q-args>, { 'source': 'ag --hidden -U -g ""' })
  " autocmd VimEnter * command! -nargs=* -complete=file Commits :call fzf#vim#commits(fzf#wrap('commits',
    " \ {'options': '--preview "echo {} | grep -o ''[a-f0-9]\{7\}'' | head -1 | xargs -I % sh -c ''git log -1 --stat --color=always %''"'}))
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

" aug neoterm_test_rspec
  " au VimEnter,BufRead,BufNewFile *_spec.rb,*_feature.rb call neoterm#test#libs#add('rspec')
  " au VimEnter *
        " \ if filereadable('spec/spec_helper.rb') |
        " \   call neoterm#test#libs#add('rspec') |
        " \ endif
" aug END

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

" cmap W w !sudo tee % >/dev/null<CR>
"
set guioptions-=m

" search for word under cursor
" nnoremap * /<C-R><C-W><CR>
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

function! SortLines()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  execute 'c"'
  let sortedLines = sort(lines)
  put=sortedLines
  " let lines[0] = lines[0][col1 - 1:]
  " return join(sortedLines, "\n")
endfunction

function! s:open_controller(e)
  execute "normal! :Econtroller " . split(a:e)[-1] . "\<cr>"
endfunction

command! Railway call fzf#run({
\ 'source':  "bin/rails routes",
\ 'sink':    function('<sid>open_controller'),
\ 'options': '-m -x +s',
\ 'down':    '40%' })

fu! EsearchInFiles(argv) abort
  let original = g:esearch#adapter#ag#options
  let g:esearch#adapter#ag#options = input('Search options: ')
  call esearch#init(a:argv)
  let g:esearch#adapter#ag#options = original
endfu

" replace these mapping with the ones you prefer
noremap  <silent><leader>ft :<C-u>call EsearchInFiles({})<CR>

augroup CloseLoclistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END
