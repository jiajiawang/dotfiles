return {
  {
    "b3nj5m1n/kommentary",
    setup = function()
      vim.g.kommentary_create_default_mappings = false
    end,
    config = function()
      require("kommentary.config").configure_language("default", { prefer_single_line_comments = true })
    end,
    keys = {
      {
        "<leader>cc",
        "<Plug>kommentary_line_default",
        desc = "comment line",
        mode = "n",
      },
      {
        "<leader>cc",
        "<Plug>kommentary_visual_default<C-c>",
        desc = "comment visual",
        mode = "x",
      },
    },
  },
}
