-- https://github.com/gbprod/cutlass.nvim
return {
  "gbprod/cutlass.nvim",
  lazy = false,
  opts = {
    cut_key = "x",
  },
  keys = {
    --cutlass doesn't map Select mode by default
    {
      "<S-x>",
      "<S-v>x",
      mode = "v",
    },
  },
}
