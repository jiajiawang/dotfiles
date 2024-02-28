return {
  {
    "SirVer/ultisnips",
    dependencies = {
      {
        "nvim-cmp",
        dependencies = {
          {
            "quangnguyen30192/cmp-nvim-ultisnips",
            config = function()
              -- optional call to setup (see customization section)
              require("cmp_nvim_ultisnips").setup({})
            end,
          },
        },
        opts = function(_, opts)
          opts.snippet = {
            expand = function(args)
              vim.fn["UltiSnips#Anon"](args.body)
            end,
          }
          table.insert(opts.sources, { name = "ultisnips" })
        end,
      },
      { "saadparwaiz1/cmp_luasnip" },
      { "honza/vim-snippets" },
    },
    config = function()
      vim.g.UltiSnipsSnippetDirectories = { "UltiSnips", "mycoolsnippets" }
    end,
  },
}
