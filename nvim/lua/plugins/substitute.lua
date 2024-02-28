return {
  {
    "gbprod/substitute.nvim",
    config = function()
      require("substitute").setup({})
    end,
    keys = {
      {
        "<leader>r",
        "",
        desc = "+substitute",
      },
      {
        "<leader>rs",
        function()
          require("substitute").operator()
        end,
        desc = "substitute operator",
      },
      {
        "<leader>rS",
        function()
          require("substitute").line()
        end,
        desc = "substitute line",
      },
    },
  },
}
