require("config.lazy")

vim.opt.spell = false

vim.diagnostic.config({
	signs = false,
	underline = false,
})

vim.opt.wrap = false

vim.opt.inccommand = "split"

vim.opt.signcolumn = "yes"

vim.opt.cmdheight = 0

--for mardown notes--
vim.opt.conceallevel = 2
--Yank highlight--

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	callback = function()
		vim.highlight.on_yank({
			higroup = "Visual",
			timeout = 160,
		})
	end,
})

--move line up or down --

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

--paster behavior for pasting multiple lines
vim.keymap.set("n", "p", function()
	local text = vim.fn.getreg("+")

	if text:find("\n") then
		vim.cmd("put +")
	else
		vim.cmd('normal! "+p')
	end
end, { noremap = true, silent = true })

--“paste without overwriting yank register--

--indentation
vim.keymap.set("v", "<", "<gv^")
vim.keymap.set("v", ">", ">gv^")

vim.diagnostic.config({
	signs = false,
})

vim.opt.clipboard = "unnamedplus"
-- =========================
-- BASIC SETTINGS
-- =========================

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.tabstop = 2 -- tabs = 4 spaces
vim.opt.shiftwidth = 2 -- autoindent size
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.smartindent = true
-- Cursor line highlight
vim.opt.cursorline = true

-- Better scrolling
vim.opt.scrolloff = 8

-- Enable mouse (optional)
vim.opt.mouse = "a"

-- Clipboard (system clipboard)
vim.opt.clipboard = "unnamedplus"

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Faster updates
vim.opt.updatetime = 300

-- =========================
-- KEYBINDS
-- =========================

vim.keymap.set("n", "XX", ":qa!<CR>", {
	noremap = true,
	silent = true,
	desc = "Force quit without saving",
})

-- Set leader key (space)
vim.g.mapleader = " "

-- jj → escape (insert mode)
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })

-- Save file
vim.keymap.set("n", "<leader>w", ":w<CR>")

-- Quit
vim.keymap.set("n", "<leader>q", ":q<CR>")

-- Clear search highlight
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

--keep cursor at centre while ctrl d/u --

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- =========================
-- UI TWEAKS
-- =========================

-- Better colors
vim.opt.termguicolors = true

-- Split behavior
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Disable swapfile
vim.opt.swapfile = true
vim.opt.backup = false

vim.opt.undofile = true
-- =========================
-- DONE
-- =========================

-- Markdown files headig turnoff
vim.api.nvim_set_hl(0, "@markup.heading.2.markdown", {
	fg = "#b4befe",
	bold = true,
	italic = true,
})
--- Turn off spell check for md file

-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "markdown",
-- 	callback = function(args)
-- 		vim.schedule(function()
-- 			vim.api.nvim_set_option_value("spell", false, {
-- 				win = vim.fn.bufwinid(args.buf),
-- 			})
-- 		end)
-- 	end,
-- })

-- local function fade_hex(hex, factor)
--   hex = hex:gsub("#", "")
--   local r = tonumber(hex:sub(1,2), 16)
--   local g = tonumber(hex:sub(3,4), 16)
--   local b = tonumber(hex:sub(5,6), 16)
--
--   r = math.floor(r * factor)
--   g = math.floor(g * factor)
--   b = math.floor(b * factor)
--
--   return string.format("#%02x%02x%02x", r, g, b)
-- end
--
-- local function fade_highlights()
--   for _, group in ipairs(vim.fn.getcompletion("", "highlight")) do
--     local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group })
--     if ok and hl.fg then
--       local faded = fade_hex(string.format("#%06x", hl.fg), 0.6)
--       vim.api.nvim_set_hl(0, group, vim.tbl_extend("force", hl, { fg = faded }))
--     end
--   end
-- end
--
-- fade_highlights()
