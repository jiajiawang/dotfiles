return {
  "eugen0329/vim-esearch",
  lazy = true,
  config = function()
    vim.g.esearch = {
      adapter = "rg",
      backend = "nvim",
      out = "win",
      batch_size = 1000,
      -- default_mappings = 0,
      live_update = 0,
      prefill = { "hlsearch", "last", "clipboard" },
    }
  end,
  keys = {
    {
      "<leader>se",
      "<plug>(esearch)",
      desc = "Start esearch",
    },
    {
      "<leader>s,",
      function()
        local pickers = require("telescope.pickers")
        local finders = require("telescope.finders")
        local conf = require("telescope.config").values
        local actions = require("telescope.actions")
        local action_state = require("telescope.actions.state")
        local colors = function(opts)
          opts = opts or {}
          pickers
            .new(opts, {
              prompt_title = "colors",
              finder = finders.new_table({
                results = { "red", "green", "blue" },
              }),
              sorter = conf.generic_sorter(opts),
              attach_mappings = function(prompt_bufnr, map)
                actions.select_default:replace(function()
                  actions.close(prompt_bufnr)
                  local selection = action_state.get_selected_entry()
                  -- print(vim.inspect(selection))
                  vim.api.nvim_put({ selection[1] }, "", false, true)
                end)
                return true
              end,
            })
            :find()
        end
        vim.cmd([[
          let g:esearch#auto_close = 1
          Esearch
        ]])
      end,
      desc = "Start esearch",
    },
    {
      "<leader>sf",
      "<plug>(operator-esearch-prefill)",
      desc = "Prefill esearch",
      mode = "n",
    },
    {
      "<leader>sf",
      "<plug>(operator-esearch-exec)",
      desc = "Exec esearch",
      mode = "v",
    },
  },
}
