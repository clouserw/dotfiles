return {
  "hxueh/beancount.nvim",
  ft = { "beancount", "bean" },
  dependencies = {
    {
      "saghen/blink.cmp",
      optional = true,
      opts = function(_, opts)
        table.insert(opts.sources.default, "beancount")
        opts.sources.providers = opts.sources.providers or {}
        opts.sources.providers.beancount = {
          name = "beancount",
          module = "beancount.completion.blink",
          score_offset = 100,
          opts = {
            trigger_characters = { ":", "#", "^", '"', " " },
          },
        }
        return opts
      end,
    },
    {
      "L3MON4D3/LuaSnip",
    },
  },
  --# config = function()
  --#   require("beancount").setup({})
  --#   -- Treesitter setup
  --#  ; require("nvim-treesitter.configs").setup({
  --#     ensure_installed = { "beancount" },
  --#     highlight = { enable = true },
  --#     incremental_selection = { enable = true },
  --#     indent = { enable = true },
  --#   })
  --# end,
}
