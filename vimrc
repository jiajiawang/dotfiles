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
Bundle 'fholgado/minibufexpl.vim'
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
        colorscheme Tomorrow-Night-Eighties
    else
        colorscheme jellybeans
    endif
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
set statusline=%7*\[%n]                              " buffernr
set statusline+=%1*\ %<%f\                           " File
set statusline+=%2*%{fugitive#statusline()}\            " Fugitive status
set statusline+=%3*\ %y\                             " FileType
set statusline+=%4*\ %{''.(&fenc!=''?&fenc:&enc).''} " Encoding
set statusline+=%4*\ %{(&bomb?',BOM':'')}\           " Encoding2
set statusline+=%5*\ %{&ff}\                         " FileFormat (dos/unix..)
set statusline+=%6*%{SyntasticStatuslineFlag()}      " Syntastic warning message
set statusline+=%8*\ %m%r%w\                         " Modified? Readonly?
set statusline+=%=                                   " Start right align
set statusline+=%{tagbar#currenttag('\ <%s>\ ','')}  " Current tag
set statusline+=%0*%5l,%-3c\ ln:%-5L                 " Row,col ln:TotalLineNumber
set statusline+=%14.([%03b]\ [0x%04B]%)\             " Character under curdor

" status line colors
hi User1 guifg=#000000  guibg=#f2777a
hi User2 guifg=#000000  guibg=#f2777a
hi User3 guifg=#292b00  guibg=#f4f597
hi User4 guifg=#112605  guibg=#aefe7B
hi User5 guifg=#051d00  guibg=#7dcc7d
hi User6 guifg=#ffffff  guibg=#810085 gui=bold
hi User7 guifg=#000000  guibg=#f2777a gui=bold
hi User8 guifg=#ffffff  guibg=#5b7fbb
hi User0 guifg=#ffffff  guibg=#094afe
hi MBENormal guifg=#202020 guibg=#aaaaaa
hi MBEChanged guifg=#202020 guibg=#aaaaaa
hi MBEVisibleNormal guifg=#202020 guibg=#aaaaaa
hi MBEVisibleChanged guifg=#202020 guibg=#aaaaaa
hi MBEVisibleActiveNormal guifg=#080808  guibg=#eeeeee gui=bold
hi MBEVisibleActiveChanged guifg=#080808  guibg=#eeeeee gui=bold

augroup startgroup
    " 
    autocmd FileType * set tabstop=4|set shiftwidth=4
    autocmd FileType ruby set tabstop=2|set shiftwidth=2


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
let g:ctrlp_clear_cache_on_exit = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.vim/mycoolsnippets"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mycoolsnippets"]
let g:SuperTabDefaultCompletionType="context"
let g:miniBufExplMinSize=2

" mapping
let mapleader=","

" quick align
map <leader><leader>a :Align = , : => -><cr>

nnoremap <f1> :NERDTreeToggle<cr>
nnoremap <f2> :TagbarToggle<cr>
nnoremap <f3> :MBEToggle<cr>
nnoremap <leader>bf :MBEbf<cr>
nnoremap <leader>bb :MBEbb<cr>
nnoremap <leader>bp :MBEbp<cr>
nnoremap <leader>bn :MBEbn<cr>
nnoremap <leader>mb :MBEFocus<cr>


" Shifting blocks visually
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Alt-X are Cut
vnoremap <A-x> "+x

" Alt-C are Copy
vnoremap <A-v> "+y

" Alt-V are Paste
map <A-v> "+gP
cmap <A-v> <C-R>+

" Use Alt-S for saving, also in Insert mode
noremap <A-s>		:update<CR>
vnoremap <A-s>		<C-C>:update<CR>
inoremap <A-s>		<C-O>:update<CR>

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
" Replace Esc with Alt-I (Command-I in Mac OS)
inoremap <A-i> <Esc>
inoremap <D-i> <Esc>
vnoremap <A-i> <Esc>
vnoremap <D-i> <Esc>
cnoremap <A-i> <Esc>
cnoremap <D-i> <Esc>

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


" Get a list of all buffers path
function! GetBuffersPathList()
    let blist = []
    let bffs = ""
    silent! redir => bffs
    silent! execute "ls"
    redir END
    for bff in split(bffs, '\v\n')
        let bffpath = substitute(substitute(bff, '\v^[^"]*"', '', ''), '\v".*$', '', '')
        call add(blist, bffpath)
    endfor
    return blist
    No such file or directory
endfun

" Customize a '.' operator complete function
" find parent->child->... patterns in all buffers
" the supported formats includes:
"       p.c, p[c], p['c'], p["c"], p{c}, p{'c'}, p{"c"}
"       p->c, p->{c}, p->{"c"}, p->{'c'},  p->[c], p->["c"], p->['c']
" example:
"       p.j.t will match person.job.title, person->job->title, person{job}{title}
" For SuperTab user, please make sure that you have 'let g:SuperTabDefaultCompletionType="context"'
function! CompleteDotOperator(findstart, base)
    if a:findstart
        return match(strpart(getline('.'), 0, col('.') - 1), '\v(\w+\.)+\w+$')
    else
        let patterns = []
        let first = matchstr(a:base, '\v^\w+') . '\w*'
        let rest = matchstr(a:base, '\v\..*$')

        " parent.child, parent->child
        call add(patterns, '"' . first . substitute(rest, '\v\.(\w+)', '(\\.\\|->)\1\\w*', 'g') . '"')
        " parent{child}, parent{'child'}, parent{"child"}, parent[child], parent['child'], parent["child"]
        " parent->{child}, parent->{'child'}, parent->{"child"}, parent->[child], parent->['child'], parent->["child"]
        call add(patterns, '"' . first . substitute(rest, '\v\.(\w+)', '(->)?(\\{\\|\\[)(\\"\\|' . "'" . ')?\1\\w*(\\"\\|' . "'" . ')?(\\}\\|\\])', 'g') . '"')

        " format grep command
        let grepcommand = 'grep'
        for pattern in patterns
            let grepcommand .= ' -e ' . pattern
        endfor
        let filenames = join(GetBuffersPathList(), ' ')
        let grepcommand .= ' ' . filenames

        " remember things will be affected
        let gprg = &grepprg
        let qflist = getqflist()

        " run grep command and collect results
        " it requires a grep command that supports -o option (match only)
        set grepprg=grep\ -Eiho "Extended regular expression, ignore case, no filenames, match only
        silent! execute grepcommand
        let res = []
        " save my time in perl
        let prefix = &filetype ==? 'perl' ? '' : ''
        for i in getqflist()
            call add(res, prefix . i.text)
        endfor

        " restore things affected
        let &grepprg = gprg
        call setqflist(qflist, 'r')

        return res
    endif
endfun
set completefunc=CompleteDotOperator

