require('plugins')

-- options
vim.o.shell = "/bin/zsh"
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
-- vim.o.terse=true
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
vim.cmd([[au FocusLost * silent! wa]])
vim.cmd([[autocmd FileType ruby let b:surround_45 = "do\n\r\nend"]])
vim.cmd([[autocmd FileType javascriptreact UltiSnipsAddFiletypes javascript]])
vim.cmd([[augroup END]])

function _G.glow()
  local current = vim.api.nvim_get_current_buf()
  local file = vim.api.nvim_buf_get_name(0)
  local lines = vim.api.nvim_buf_get_lines(current, 0, -1, false)
  vim.cmd([[vsplit]])
  buf = vim.api.nvim_create_buf(false, true)
  vim.g.glow_buf = buf
  vim.api.nvim_win_set_buf(0, buf)
  vim.api.nvim_command("terminal")
  local channel = vim.api.nvim_buf_get_option(buf, "channel")
  vim.call("chansend", channel, "zsh\n")
  vim.call("chansend", channel, string.format("clear; glow <(echo '%s')\n", table.concat(lines, "\n")))
  --[[ vim.api.nvim_buf_call(buf, function()    vim.fn.termopen(string.format("clear; glow %s;", file))
  end) ]]
  vim.api.nvim_buf_attach(current, false, {
    on_lines = function(lines, buf)
      print("changed")
      local glow_buf = vim.g.glow_buf
      local channel = vim.api.nvim_buf_get_option(glow_buf, "channel")
      local file = vim.api.nvim_buf_get_name(buf)
      local glow_file = vim.api.nvim_buf_get_name(glow_buf)
      local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
      print(file)
      print(glow_file)
      print(channel)
      vim.call("chansend", channel, string.format("clear; glow <(echo '%s')\n", table.concat(lines, "\n")))
      -- vim.api.nvim_buf_call(vim.g.glow_buf, function()
        -- vim.fn.termopen(string.format("clear; glow %s;", file))
      -- end)
    end
  })
end

function _G.dump(...)
  local objects = vim.tbl_map(vim.inspect, {...})
  print(unpack(objects))
end

function _G.browse(uri)
  local path = vim.fn.shellescape(uri)
  vim.cmd('! open '..path)
end
vim.cmd("command! -nargs=? Browse :lua browse('<args>')")
