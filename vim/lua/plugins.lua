-- ensure packer.nvim is installed
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

-- disable unused buildin plugins
local disabled_built_ins = {
    --[[ "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers", ]]
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

-- plugins
return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Color
  use {
    'eddyekofo94/gruvbox-flat.nvim',
    config = function()
      vim.g.gruvbox_flat_style = "dark"
    end
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require "plugins.nvim-treesitter"
    end
  }
  use {
    'nvim-treesitter/playground',
    cmd = "TSPlaygroundToggle"
  }
  use {'nvim-treesitter/nvim-treesitter-textobjects'}

  -- Explorer, search
  use {
    'kyazdani42/nvim-tree.lua',
    -- cmd = { 'NvimTreeToggle', 'NvimTreeFindFile' },
    -- keys = { '<leader>to', '<leader>tf' }
    config = function()
      vim.g.nvim_tree_disable_netrw = 0
      vim.api.nvim_set_keymap('n', '<leader>to', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>tf', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
    end
  }
  use {
    'junegunn/fzf.vim',
    requires = {
      '/usr/local/opt/fzf'
    },
    setup = function()
      vim.g.fzf_history_dir = '~/.local/share/fzf-vim-history'
      -- vim.cmd([[let $FZF_DEFAULT_OPTS='--layout=reverse']])
    end,
    config = function()
      vim.api.nvim_set_keymap('n', '<C-p>', ':Files<CR>', { silent = true })
      vim.api.nvim_set_keymap('n', ';', ':Buffers<CR>', { silent = true })
      vim.api.nvim_set_keymap('n', '<C-g>', ':BLines<CR>', { silent = true })
    end
  }
  use {
     'eugen0329/vim-esearch',
     config = function()
       vim.g.esearch = {
         adapter     = 'ag',
         backend     = 'nvim',
         out         = 'win',
         batch_size  = 1000,
         live_update = 0,
         prefill     = { 'hlsearch', 'last', 'clipboard' },
       },
       vim.api.nvim_set_keymap('n', '<leader>fd', ":call fzf#run({'source': 'find . -type d', 'sink': { s -> esearch#init({'paths': s}) } })<CR>", { noremap = true, silent = true })
       vim.api.nvim_set_keymap('n', '<leader>ft', ":call fzf#run({'source': 'ag --list-file-types | grep -- \"--\" | sed \"s/-//g\"', 'sink': { s -> esearch#init({'filetypes': s}) } })<CR>", { noremap = true, silent = true })
     end
  }

  -- Autocompletion, easy editing
  use {
    'ms-jpq/coq_nvim',
    branch = 'coq',
    run = 'COQdeps',
    config = function()
      vim.g.coq_settings = {
        ["keymap.jump_to_mark"] = '<C-N>',
        ["display.preview.positions"] = {
          north = 4, south = 3, west = 2, east = 1
        },
      }
    end
  }
  use {
    'ms-jpq/coq.artifacts',
    branch = 'artifacts'
  }
  use {
    'jiangmiao/auto-pairs',
    config = function()
      vim.g.AutoPairsFlyMode=1
    end
  }
  --[[ use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({})
    end
  } ]]
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-abolish'
  use {
    'SirVer/ultisnips',
    setup = function()
      vim.g.UltiSnipsExpandTrigger="<C-l>"
      vim.g.UltiSnipsEditSplit="vertical"
      vim.g.UltiSnipsSnippetsDir="~/.vim/mycoolsnippets"
      vim.g.UltiSnipsSnippetDirectories={"UltiSnips", "mycoolsnippets"}
    end
  }
  use 'honza/vim-snippets'
  use {
    'b3nj5m1n/kommentary',
    setup = function()
      vim.g.kommentary_create_default_mappings = false
    end,
    config = function()
      vim.api.nvim_set_keymap("n", "<leader>cc", "<Plug>kommentary_line_default", {})
      vim.api.nvim_set_keymap("n", "<leader>c", "<Plug>kommentary_motion_default", {})
      vim.api.nvim_set_keymap("x", "<leader>c", "<Plug>kommentary_visual_default<C-c>", {})
    end
  }
  use {
    'svermeulen/vim-cutlass',
    config = function()
      vim.api.nvim_set_keymap('n', 'x', 'd', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('v', 'x', 'd', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', 'xx', 'dd', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('v', 'X', 'D', { noremap = true, silent = true })
    end
  }
  use {
    'svermeulen/vim-yoink',
    setup = function()
      vim.g.yoinkIncludeDeleteOperations=1
      vim.g.yoinkAutoFormatPaste=1
    end,
    config = function()
      vim.api.nvim_set_keymap('n', 'p', '<plug>(YoinkPaste_p)', { silent = true })
      vim.api.nvim_set_keymap('n', 'P', '<plug>(YoinkPaste_P)', { silent = true })
      vim.api.nvim_set_keymap('n', '<C-B>', '<plug>(YoinkPostPasteSwapBack)', { silent = true })
    end
  }
  use {
    'svermeulen/vim-subversive',
    config = function()
      vim.api.nvim_set_keymap('n', 's', '<plug>(SubversiveSubstitute)', { silent = true })
    end
  }
  use {
    'junegunn/vim-easy-align',
    config = function()
      vim.api.nvim_set_keymap('v', '<Enter>', '<plug>(EasyAlign)', { silent = true })
      vim.api.nvim_set_keymap('n', 'ga', '<plug>(EasyAlign)', { silent = true })
    end
  }
  use {
    'jiajiawang/gfmt.nvim',
    run = 'go get github.com/jiajiawang/gfmt.nvim/src/gfmt'
  }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require'lspconfig'.solargraph.setup{}
      require'lspconfig'.tsserver.setup{}
      vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
    end
  }
  use {
    'glepnir/lspsaga.nvim',
    config = function()
      require'lspsaga'.init_lsp_saga()
      vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua require"lspsaga.provider".preview_definition()<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', 'gh', '<cmd>lua require"lspsaga.provider".lsp_finder()<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>ca', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>', { noremap = true, silent = true })
    end
  }

  -- -- Linter
  use {
    'w0rp/ale',
    config = function()
      vim.g.ale_open_list = 0
      vim.g.ale_sign_error = ''
      vim.g.ale_sign_warning = ''
      vim.g.ale_sign_info = ''
      vim.g.ale_lint_on_enter = 0
      vim.g.ale_lint_on_text_changed = 'never'
      vim.g.ale_lint_on_insert_leave = 0
      vim.g.ale_lint_on_filetype_changed = 0
      vim.g.ale_linters = {
        javascript = { 'eslint' }, 
        javascriptreact = { 'eslint' }, 
        ruby = { 'reek', 'rubocop', 'ruby' }, 
      }
      vim.g.ale_fixers = {
        javascript = { 'prettier' }, 
        javascriptreact = { 'prettier' }, 
        css = { 'prettier' }, 
        scss = { 'prettier' }, 
      }
      vim.g.ale_fix_on_save = 1
      vim.g.ale_emit_conflict_warnings = 0
      vim.g.ale_pattern_options_enabled = 1
    end
  }

  -- Session
  use 'tpope/vim-obsession'

  -- Git, github
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'

  -- Easymotion
  use {
    'Lokaltog/vim-easymotion',
    config = function()
      vim.api.nvim_set_keymap('n', 'f', "<Plug>(easymotion-overwin-f2)", {})
    end
  }
  use 'kana/vim-textobj-user'
  use 'nelstrom/vim-textobj-rubyblock'
  use 'michaeljsmith/vim-indent-object'
  use 'andymass/vim-matchup'
  --[[ use {
    'phaazon/hop.nvim',
    as = 'hop',
    config = function()
      require'hop'.setup()
      vim.api.nvim_set_keymap('n', '<space>w', "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<cr>", {})
      vim.api.nvim_set_keymap('n', '<space>b', "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<cr>", {})
      vim.api.nvim_set_keymap('n', '<space>l', "<cmd>lua require'hop'.hint_lines_skip_whitespace()<cr>", {})
    end
  } ]]

  -- Good looking
  use 'kyazdani42/nvim-web-devicons'
  use {
    'glepnir/galaxyline.nvim',
    requires = 'gruvbox-flat.nvim',
    config = function()
      require "plugins.galaxyline"
    end
  }
  use {
    'rrethy/vim-hexokinase',
    run = 'make hexokinase',
    setup = function()
      vim.g.Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla'
    end
  }


  -- Ruby
  use {'tpope/vim-rails'}
  use {'tpope/vim-bundler'}
  use {'tpope/vim-cucumber'}
  use {'jiajiawang/vim-ruby-helper'}
  use {'jiajiawang/vim-rubocop'}

  -- Markdown, Doc writing
  use {
    'Pocco81/TrueZen.nvim',
    cmd = { "TZAtaraxis", "TZFocus", "TZMinimalist" },
  }
  use {
    'npxbr/glow.nvim',
    run = 'GlowInstall',
    cmd = 'Glow'
  }

  -- Tmux & Terminal
  use 'roxma/vim-tmux-clipboard'
  use 'christoomey/vim-tmux-navigator'
  use {
    'janko-m/vim-test',
    config = function()
      vim.api.nvim_set_keymap('n', '<leader>rt', ':TestSuite<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>rf', ':TestFile<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>rn', ':TestNearest<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>rr', ':TestLast<CR>', { noremap = true, silent = true })
      vim.cmd([[let test#strategy="vimux"]])

    end
  }
  use 'preservim/vimux'
end)
