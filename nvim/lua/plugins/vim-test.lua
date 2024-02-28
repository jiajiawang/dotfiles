return {
  "vim-test/vim-test",
  keys = {
    {
      "<leader>tt",
      ":TestSuite<CR>",
      desc = "TestSuite",
    },
    {
      "<leader>tf",
      ":TestFile<CR>",
      desc = "TestFile",
    },
    {
      "<leader>tn",
      ":TestNearest<CR>",
      desc = "TestNearest",
    },
    {
      "<leader>tr",
      ":TestLast<CR>",
      desc = "TestLast",
    },
  },
  config = function()
    vim.cmd([[let test#strategy="vimux"]])
    vim.g["test#ruby#use_binstubs"] = 0
  end,
}
