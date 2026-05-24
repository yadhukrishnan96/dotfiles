

-- return {
--   {
--     "MeanderingProgrammer/render-markdown.nvim",
--
--     dependencies = {
--       "nvim-treesitter/nvim-treesitter",
--     },
--
--     ft = { "markdown" },
--
--     opts = {
--       completions = {
--         lsp = {
--           enabled = true,
--         },
--       },
--
--       heading = {
--         enabled = false,
--       },
--
--       code = {
--         enabled = false,
--       },
--
--       bullet = {
--         enabled = false,
--       },
--
--       checkbox = {
--         enabled = true,
--       },
--     },
--   },
-- }





























--
-- return {
--   {
--     "MeanderingProgrammer/render-markdown.nvim",
--     dependencies = {
--       "nvim-treesitter/nvim-treesitter",
--     },
--
--     ft = { "markdown" },
--
--     opts = {
--       completions = {
--         lsp = {
--           enabled = true,
--         },
--       },
--
--       enabled = false,
--     },
--   },
-- }











return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-mini/mini.nvim",
    },
    ft = { "markdown" },
    opts = {
      completions = {
        lsp = {
          enabled = true,
        },
      },
    },
  },
}
