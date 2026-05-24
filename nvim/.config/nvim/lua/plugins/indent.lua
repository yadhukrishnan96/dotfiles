return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },

      scope = {
        enabled = true,
        char = "│",
        show_start = false,
        show_end = false,
      },

      whitespace = {
        remove_blankline_trail = false,
      },

      exclude = {
        filetypes = {
          "markdown",
        },
      },
    },
  },
}
