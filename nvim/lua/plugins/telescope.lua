return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    local actions = require("telescope.actions")
    opts.defaults.mappings.i = vim.tbl_extend("force", opts.defaults.mappings.i, {
      ["<C-j>"] = actions.move_selection_next,
      ["<C-k>"] = actions.move_selection_previous,
      ["<C-p>"] = actions.cycle_history_prev,
      ["<C-n>"] = actions.cycle_history_next,
    })
  end,
}
