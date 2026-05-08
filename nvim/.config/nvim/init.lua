require("config.lazy")




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
--

vim.opt.termguicolors = true

local function fade_hex(hex, factor)
  hex = hex:gsub("#", "")
  local r = tonumber(hex:sub(1,2), 16)
  local g = tonumber(hex:sub(3,4), 16)
  local b = tonumber(hex:sub(5,6), 16)

  r = math.floor(r * factor)
  g = math.floor(g * factor)
  b = math.floor(b * factor)

  return string.format("#%02x%02x%02x", r, g, b)
end

local function fade_highlights()
  for _, group in ipairs(vim.fn.getcompletion("", "highlight")) do
    local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group })
    if ok and hl.fg then
      local faded = fade_hex(string.format("#%06x", hl.fg), 0.6)
      vim.api.nvim_set_hl(0, group, vim.tbl_extend("force", hl, { fg = faded }))
    end
  end
end

fade_highlights()
