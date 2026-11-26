local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Do things without updating the registers
keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"0p')
keymap.set("n", "<Leader>P", '"0P')
keymap.set("v", "<Leader>p", '"0p')
keymap.set("n", "<Leader>c", '"_c')
keymap.set("n", "<Leader>C", '"_C')
keymap.set("v", "<Leader>c", '"_c')
keymap.set("v", "<Leader>C", '"_C')
keymap.set("n", "<Leader>d", '"_d')
keymap.set("n", "<Leader>D", '"_D')
keymap.set("v", "<Leader>d", '"_d')
keymap.set("v", "<Leader>D", '"_D')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- Clear search highlight
keymap.set({ "n", "i" }, "<Esc>", "<cmd>nohlsearch<cr><Esc>", { desc = "Clear search highlight" })

-- Move lines up/down
keymap.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move line down" })
keymap.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move line up" })
keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move line down" })
keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move line up" })
keymap.set("x", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move selection down" })
keymap.set("x", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move selection up" })
keymap.set("x", "J", ":m '>+1<CR>gv=gv", opts)
keymap.set("x", "K", ":m '<-2<CR>gv=gv", opts)

-- Switch buffers
keymap.set("n", "H", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
keymap.set("n", "L", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- New tab
keymap.set("n", "te", ":tabedit<CR>")
keymap.set("n", "<tab>", ":tabnext<CR>", opts)
keymap.set("n", "<s-tab>", ":tabprev<CR>", opts)
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Toggle inlay hints
keymap.set("n", "<leader>i", function()
	-- require("flavius.lsp").toggleInlayHints()
end)

-- Yank current file path
keymap.set("n", "<leader>yf", function()
	require("flavius.utils.editor").yank_relative_path_with_line()
end, { desc = "Yank relative path with line number" })

keymap.set("n", "<leader>yp", function()
	require("flavius.utils.editor").yank_absolute_path_with_line()
end, { desc = "Yank absolute path with line number" })

keymap.set("v", "<leader>cc", ":<C-u>lua require('flavius.utils.editor').copy_as_codeblock()<CR>")

keymap.set("n", "<leader>j", function()
	require("flavius.utils.editor").open_package_json()
end, { desc = "Open package.json in floating window" })

keymap.set("n", "<leader>bd", function()
	require("flavius.utils.editor").delete_hidden_buffers()
end, { desc = "Delete hidden buffers" })
