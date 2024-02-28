return {}
-- require("telescope.builtin").find_files({
--   attach_mappings = function(_, map)
--     map("i", "asdf", function(_prompt_bufnr)
--       print("You typed asdf")
--     end)

--     map({ "i", "n" }, "<C-r>", function(_prompt_bufnr)
--       print("You typed <C-r>")
--     end)

--     -- needs to return true if you want to map default_mappings and
--     -- false if not
--     return true
--   end,
-- })
-- return {
--   "nvim-telescope/telescope.nvim",
--   opts = function(_, opts)
--     opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
--       mappings = { n = { s = flash }, i = { ["<c-s>"] = flash } },
--     })
--     opts.config = function()
--       require("telescope.builtin").find_files({
--         attach_mappings = function(_, map)
--           map("i", "asdf", function(_prompt_bufnr)
--             print("You typed asdf")
--           end)

--           map({ "i", "n" }, "<C-r>", function(_prompt_bufnr)
--             print("You typed <C-r>")
--           end)

--           -- needs to return true if you want to map default_mappings and
--           -- false if not
--           return true
--         end,
--       })
--     end
--   end,
-- }
-- -- local pickers = require("telescope.pickers")
-- -- local finders = require("telescope.finders")
-- -- local conf = require("telescope.config").values
-- -- local actions = require("telescope.actions")
-- -- local action_state = require("telescope.actions.state")

-- -- -- our picker function: colors
-- -- local colors = function(opts)
-- --   opts = opts or {}
-- --   pickers
-- --     .new(opts, {
-- --       prompt_title = "colors",
-- --       finder = finders.new_table({
-- --         results = { "red", "green", "blue" },
-- --       }),
-- --       sorter = conf.generic_sorter(opts),
-- --     })
-- --     :find()
-- -- end

-- -- require("telescope")
