return {
	{
		"LazyVim/LazyVim",
		opts = function(_, opts)
			opts.colorscheme = "custom"

			vim.api.nvim_create_autocmd("ColorScheme", {
				callback = function() end,
			})
		end,
	},
}

-- return {
--   {
--     "LazyVim/LazyVim",
--     priority = 1000,
--     config = function()
--       vim.cmd.colorscheme("dosbox-black")
--     end,
--   },
-- }

-- return {
--   {
--     "AlexvZyl/nordic.nvim",
--     lazy = false,
--     priority = 1000,
--
--     config = function()
--       require("nordic").setup({
--         bold_keywords = false,
--         italic_comments = true,
--
--         transparent = {
--           bg = true,
--           float = true,
--         },
--
--         bright_border = false,
--
--         reduced_blue = true,
--         swap_backgrounds = true,
--
--         cursorline = {
--           bold = false,
--           bold_number = false,
--           theme = "dark",
--           blend = 0.90,
--         },
--
--         visual = {
--           bold = false,
--           bold_number = false,
--           theme = "dark",
--           blend = 0.90,
--         },
--
--         noice = {
--           style = "flat",
--         },
--
--         telescope = {
--           style = "flat",
--         },
--
--         leap = {
--           dim_backdrop = false,
--         },
--
--         on_highlight = function(highlights, palette)
--           highlights.IndentBlanklineChar = { fg = "NONE" }
--           highlights.IblIndent = { fg = "NONE" }
--
--           highlights.NormalFloat = {
--             bg = "NONE",
--           }
--
--           highlights.FloatBorder = {
--             bg = "NONE",
--             fg = palette.gray3,
--           }
--
--           highlights.CursorLine = {
--             bg = palette.gray1,
--           }
--         end,
--       })
--
--       require("nordic").load()
--     end,
--   },
-- }

-- return {
--   {
--     "rebelot/kanagawa.nvim",
--     priority = 1000,
--
--     config = function()
--       require("kanagawa").setup({
--         theme = "dragon",
--
--         transparent = true,
--
--         colors = {
--           theme = {
--             all = {
--               ui = {
--                 bg_gutter = "none",
--               },
--             },
--           },
--         },
--       })
--
--       vim.cmd("colorscheme kanagawa-dragon")
--     end,
--   },
-- }

-- return {
--   {
--     "shaunsingh/nord.nvim",
--     priority = 1000,
--     config = function()
--       vim.g.nord_contrast = true
--       vim.g.nord_borders = false
--       vim.g.nord_disable_background = true
--       vim.g.nord_italic = true
--       vim.g.nord_uniform_diff_background = true
--       vim.g.nord_bold = true
--
--       vim.cmd.colorscheme("nord")
--     end,
--   },
-- }
