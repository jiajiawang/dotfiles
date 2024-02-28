return {
  {
    "eddyekofo94/gruvbox-flat.nvim",
    config = function()
      vim.g.gruvbox_flat_style = "dark"
    end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-flat",
    },
  },
}
