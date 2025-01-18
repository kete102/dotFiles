-- statusline
return {
  "echasnovski/mini.nvim",
  version = "*",
  config = function()
    require("mini.diff").setup({})
    require("mini.git").setup({})
    require("mini.icons").setup({})
  end,
}
