require("config.lazy")

vim.opt.clipboard = "unnamedplus"
-- =========================
-- BASIC SETTINGS
-- =========================

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.tabstop = 4        -- tabs = 4 spaces
vim.opt.shiftwidth = 4     -- autoindent size
vim.opt.expandtab = true   -- use spaces instead of tabs
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
  desc = "Force quit without saving"
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

-- =========================
-- UI TWEAKS
-- =========================

-- Better colors
vim.opt.termguicolors = true

-- Split behavior
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Disable swapfile
vim.opt.swapfile = false

-- =========================
-- DONE
-- =========================
