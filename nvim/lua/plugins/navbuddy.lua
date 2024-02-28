-- https://github.com/SmiteshP/nvim-navbuddy
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "SmiteshP/nvim-navbuddy",
      dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
      },
      opts = { lsp = { auto_attach = true } },
      keys = {
        {
          "<leader>j",
          function()
            require("nvim-navbuddy").open()
          end,
          desc = "open navbuddy",
        },
      },
    },
  },
  -- your lsp config or other stuff
}
