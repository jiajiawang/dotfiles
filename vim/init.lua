require('plugins')

-- options
vim.o.shell = "/bin/bash"
vim.g.mapleader=','

vim.cmd([[syn on]])
vim.o.termguicolors=true
vim.o.background = 'dark'
vim.cmd([[colorscheme gruvbox-flat]])

vim.o.mouse=''
-- vim.o.guifont="Ubuntu Mono:h11"
vim.o.backup=false
vim.o.swapfile=false

vim.o.hidden=true
vim.o.cmdheight=2
vim.o.signcolumn='yes'
-- vim.o.backspace="indent,eol,start" -- allow backspacing over everything in insert mode
vim.wo.cursorline=true
vim.o.ignorecase=true
vim.o.smartcase=true

vim.cmd([[set smartindent]])
vim.cmd([[set smarttab]])
vim.cmd([[set tabstop=4]])
vim.cmd([[set softtabstop=4]])
vim.cmd([[set shiftwidth=2]])
vim.cmd([[set expandtab]])

vim.bo.textwidth=80
vim.bo.formatoptions='cq'
vim.wo.number=true
vim.o.terse=true
vim.o.scrolloff=5
vim.bo.complete=vim.bo.complete .. ',k,]'
vim.o.previewheight=20
vim.o.splitbelow=true
vim.o.splitright=true
vim.o.diffopt='filler,internal,algorithm:histogram,indent-heuristic'
vim.o.foldlevelstart=2
vim.o.inccommand='split'

vim.o.grepprg='ag --vimgrep --nogroup --nocolor'

vim.o.completeopt = "menuone,noselect"

-- mapping
vim.api.nvim_set_keymap('', 'j', 'gj', { silent = true })
vim.api.nvim_set_keymap('', 'k', 'gk', { silent = true })

vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { silent = true })

vim.api.nvim_set_keymap('n', '<leader>ww', ':w<CR>', { noremap = true, silent = true })

-- aucmd
vim.cmd([[augroup startgroup]])
vim.cmd([[autocmd VimEnter * COQnow]])
vim.cmd([[au FocusLost * silent! wa]])
vim.cmd([[autocmd FileType ruby let b:surround_45 = "do\n\r\nend"]])
vim.cmd([[autocmd FileType javascriptreact UltiSnipsAddFiletypes javascript]])
vim.cmd([[augroup END]])

