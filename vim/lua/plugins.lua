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
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
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
      require "nvim-treesitter.configs".setup {

      }
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
      require'nvim-tree'.setup({})
      -- vim.g.nvim_tree_disable_netrw = 0
      vim.api.nvim_set_keymap('n', '<leader>to', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>tf', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
    end
  }
  use 'tiagofumo/vim-nerdtree-syntax-highlight'
  --[[ use {
    'ms-jpq/chadtree',
    branch = 'chad',
    run = ':CHADdeps',
    config = function()
      vim.g.chadtree_settings = {
        options = {
          follow = true
        },
        theme = {
          text_colour_set = 'nerdtree_syntax_dark'
        },
      }
      vim.api.nvim_set_keymap('n', '<leader>to', '<cmd>CHADopen<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>tf', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
    end
  } ]]
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
      vim.cmd([[command! -bang -nargs=* MyAg call fzf#vim#ag(<q-args>, { 'options': '--preview "linestart=\$(expr {+2} - 5); if [ \$linestart -lt 0 ]; then linestart=0; fi; lineend=\$(expr {+2} + 5); bat --theme="OneHalfDark" --style=numbers,changes --color=always --line-range \$linestart:\$lineend {+1}" --delimiter : --nth 4..' }, <bang>0)]])
      vim.api.nvim_set_keymap('n', '<C-f>', ':MyAg<CR>', { silent = true })
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
    run = ':COQdeps',
    setup = function()
      vim.g.coq_settings = {
        auto_start = true,
        keymap = {
          jump_to_mark = "<C-N>",
          ["repeat"] = "<leader>8",
        },
        display = {
          ["preview.positions"] = {
            north = 4, south = 3, west = 2, east = 1
          },
          ["pum.fast_close"] = false,
        },
      }
    end
  }
  use {
    'ms-jpq/coq.artifacts',
    branch = 'artifacts'
  }
  use {
    'ms-jpq/coq.thirdparty',
    config = function()
      require("coq_3p") {
        { src = "copilot", short_name = "COP", accept_key = "<c-f>" }
      }
    end
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
      -- vim.api.nvim_set_keymap('n', '<C-B>', '<plug>(YoinkPostPasteSwapBack)', { silent = true })
    end
  }
  use {
    'svermeulen/vim-subversive',
    config = function()
      vim.api.nvim_set_keymap('n', '<leader><leader>s', '<plug>(SubversiveSubstitute)', { silent = true })
      vim.api.nvim_set_keymap('n', '<leader><leader>ss', '<plug>(SubversiveSubstituteLine)', { silent = true })
      vim.api.nvim_set_keymap('n', '<leader><leader>S', '<plug>(SubversiveSubstituteToEndOfLine)', { silent = true })
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
  use {
    'mattn/emmet-vim',
    config = function()
      vim.g.user_emmet_settings = {
        indentation = '  '
      }
    end
  }
  use {
    'AndrewRadev/splitjoin.vim',
    config = function()
      vim.g.splitjoin_ruby_curly_braces = 0
      vim.g.splitjoin_ruby_hanging_args = 0
    end
  }
  use {
    'github/copilot.vim',
    run = ':Copilot setup'
  }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    config = function()
      -- require'lspconfig'.solargraph.setup{}
      require'lspconfig'.tsserver.setup{}
      vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
    end
  }
  --[[ use {
    'glepnir/lspsaga.nvim',
    branch = "main",
    config = function()
      local saga = require("lspsaga")
      saga.init_lsp_saga({
      })
      vim.api.nvim_set_keymap('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader><leader>k', '<cmd>Lspsaga hover_doc<CR>', { noremap = true, silent = true })
    end
  } ]]
  use {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
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
        typescript = { 'eslint' }, 
        javascript = { 'eslint' }, 
        javascriptreact = { 'eslint' }, 
        ruby = { 'reek', 'rubocop', 'ruby', 'prettier' }, 
      }
      vim.g.ale_fixers = {
        typescript = { 'prettier' }, 
        javascript = { 'prettier' }, 
        javascriptreact = { 'prettier' }, 
        css = { 'prettier' }, 
        scss = { 'prettier' }, 
        ruby = { 'prettier' }, 
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
  use 'ThePrimeagen/git-worktree.nvim'

  -- Easymotion
  --[[ use {
    'Lokaltog/vim-easymotion',
    config = function()
      vim.g.EasyMotion_smartcase = 1
      vim.api.nvim_set_keymap('n', 'f', "<Plug>(easymotion-overwin-f2)", {})
    end
  } ]]
  use 'kana/vim-textobj-user'
  use 'nelstrom/vim-textobj-rubyblock'
  use 'michaeljsmith/vim-indent-object'
  use 'andymass/vim-matchup'
  --[[ use {
    'phaazon/hop.nvim',
    as = 'hop',
    config = function()
      require'hop'.setup()
      vim.api.nvim_set_keymap('n', '<leader><leader>w', "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<cr>", {})
      vim.api.nvim_set_keymap('n', '<leader><leader>b', "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<cr>", {})
      vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_char2({ multi_windows = true })<cr>", {})
      vim.api.nvim_set_keymap('n', '<leader><leader>j', "<cmd>lua require'hop'.hint_lines({ multi_windows = true })<cr>", {})
    end
  } ]]
  --[[ use {
    'ggandor/lightspeed.nvim',
    config = function()
      vim.api.nvim_set_keymap('n', 'f', '<Plug>Lightspeed_omni_s', { silent = true })
      vim.api.nvim_set_keymap('n', 'F', '<Plug>Lightspeed_omni_gs', { silent = true })
    end
  } ]]
  use {
    'ggandor/leap.nvim',
    config = function()
      require'leap'.setup {
        case_insensitive = true,
      }
      require'leap'.set_default_keymaps()
      vim.api.nvim_set_keymap('n', 'F', "<Plug>(leap-cross-window)", {})
    end
  }

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
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      local actions = require "telescope.actions"
      require'telescope'.setup{
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            }
          }
        },
        extensions = {
          fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                             -- the default case_mode is "smart_case"
          }
        }
      }
      require('telescope').load_extension('fzf')
      require('telescope').load_extension('git_worktree')
      vim.api.nvim_set_keymap('n', '<leader>wt', '<cmd>lua require("telescope").extensions.git_worktree.git_worktrees()<cr>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<leader>wc', '<cmd>lua require("telescope").extensions.git_worktree.create_git_worktree()<cr>', { noremap = true })
    end
  }
  --[[ use {
    'oberblastmeister/neuron.nvim',
    branch = 'unstable',
    as = 'neuron',
    config = function()
      require'neuron'.setup {
        virtual_titles = true,
        mappings = true,
        run = nil, -- function to run when in neuron dir
        neuron_dir = "~/neuron", -- the directory of all of your notes, expanded by default (currently supports only one directory for notes, find a way to detect neuron.dhall to use any directory)
        leader = "gz", -- the leader key to for all mappings, remember with 'go zettel'
      }
    end
  } ]]
  use {
    'Pocco81/TrueZen.nvim',
    cmd = { "TZAtaraxis", "TZFocus", "TZMinimalist" },
  }
  use {
    'npxbr/glow.nvim',
    run = ':GlowInstall',
    cmd = 'Glow'
  }

  -- Yank
  use {
    "AckslD/nvim-neoclip.lua",
    config = function()
      require('neoclip').setup({
        on_paste = {
          set_reg = true,
        },
        keys = {
          telescope = {
            i = {
              select = '<c-s>',
              paste = '<cr>',
              paste_behind = '<s-cr>',
              custom = {},
            },
          },
        },
      })
      require('telescope').load_extension('neoclip')
      vim.api.nvim_set_keymap('n', '<C-B>', '<cmd>Telescope neoclip<cr>', { silent = true })
    end
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

  -- Browser
  use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end,
    setup = function()
      vim.g.firenvim_config = {
        globalSettings = {
          alt = 'all'
        },
        localSettings = {
          ['.*'] = {
              cmdline = 'neovim',
              content = 'text',
              priority = 0,
              selector = 'textarea',
              takeover = 'never'
          },
        }
      }
    end
  }
end)
