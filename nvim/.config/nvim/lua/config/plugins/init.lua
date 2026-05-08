return {
  {
    "nvim-mini/mini.comment",
    opts = {},
  },
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
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    keys = {
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files({
            cwd = vim.fn.expand("~/.config"),
          })
        end,
        desc = "Find config files",
      },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep text" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    },
    opts = {
      pickers = {
        find_files = {
          find_command = {
            "fd",
            "--type",
            "f",
            "--follow",
            "--exclude",
            ".git",
          },
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
  },
}
