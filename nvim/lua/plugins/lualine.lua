return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lualine").setup({
      options = {

        theme = "kanagawa",
        icons_enbled = true,
      },
      sections = {
        lualine_a = {
          {
            "mode",
            icon = " ",
          },
        },
      },
    })
  end,
}
