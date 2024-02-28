-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>fp", function()
  vim.cmd.edit(vim.api.nvim_exec([[echo getreg('+')]], true))
end, { desc = "edit file from the clipboard" })
vim.keymap.set("n", "<leader>sl", function()
  require("telescope.builtin").live_grep({
    propmt_title = "Find Lua File",
    type_filter = "js",
    attach_mappings = function(_, map)
      local pickers = require("telescope.pickers")
      local finders = require("telescope.finders")
      local conf = require("telescope.config").values
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")
      map("i", "<C-l>", function(_prompt_bufnr)
        print(action_state.get_current_picker())
      end)

      map({ "i", "n" }, "<C-r>", function(_prompt_bufnr)
        print("You typed <C-r>")
      end)

      -- needs to return true if you want to map default_mappings and
      -- false if not
      return true
    end,
  })
end, { desc = "Test" })
