-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Oil
map("n", "-", "<cmd>Oil<CR>", opts)

-- Buffers
map("n", "<leader>x", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })
map("n", "<leader>bo", function()
  Snacks.bufdelete.other()
end, { desc = "Delete Other Buffers" })

map("n", "<leader>i", function()
  require("flavius.lsp").toggleInlayHints()
end)

map("n", "<leader>r", function()
  require("craftzdog.hsl").replaceHexWithHSL()
end)
