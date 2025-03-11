-- lua/plugins/rose-pine.lua
return {
  "rose-pine/neovim",
  priority = 1000,
  lazy = false,
  name = "rose-pine",
  config = function()
    require("rose-pine").setup({
      variant = "main", -- main, moon, or dawn
      styles = {
        transparency = true,
      },
    })
    vim.cmd("colorscheme rose-pine")
  end,
}
