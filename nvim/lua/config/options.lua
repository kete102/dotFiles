-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Wrap long lines
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.textwidth = 80

-- Faster update time
vim.opt.updatetime = 100

-- Show invisible characters
vim.opt.list = true

-- Define symbols for invisible characters
vim.opt.listchars = {
  trail = "·", -- Display trailing spaces as '·'
  nbsp = "␣", -- Display non-breaking spaces as '␣'
  tab = "» ", -- Display tabs as '»' followed by a space
  -- eol = "↩",        -- Display end-of-line as '↩'
  extends = ">", -- Display '>' at the end of wrapped lines
  precedes = "<", -- Display '<' at the beginning of wrapped lines
  space = "·", -- Display regular spaces as '·'
}

-- Scrolloff
vim.opt.scrolloff = 15

--Clipboard
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

-- Case-insensitive search unless \C or one or more capital letter in the
-- search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Number of spaces per tab
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

-- Terminal colors
vim.opt.termguicolors = true
