return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lualine").setup({
      options = {

        theme = "gruvbox_dark",
        icons_enbled = true,
      },
      sections = {
        lualine_a = {
          {
            "mode",
            icon = "",
          },
        },
      },
    })
  end,
}
