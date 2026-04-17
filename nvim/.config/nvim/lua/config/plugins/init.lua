return {
    {
  "nvim-mini/mini.comment",
  opts = {},
},
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup()
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    version = "*",

    keys = {
      -- 🔥 now searches ONLY ~/.config
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

    -- optional: keep fd config minimal now
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

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },
}
