return {
  "nvim-neo-tree/neo-tree.nvim",
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          always_show_by_pattern = {
            ".env*",
          },
        },
      },
      window = {
        position = "right",
      },
    })
  end,
}
