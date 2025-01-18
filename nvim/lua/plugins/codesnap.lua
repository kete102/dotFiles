return {
  "mistricky/codesnap.nvim",
  build = "make",
  keys = {
    { "<leader>cs", "<cmd>CodeSnap<cr>", mode = { "x", "v" }, desc = "Copy code snapshot into clipboard" },
    { "<leader>cv", "<cmd>CodeSnapSave<cr>", mode = { "x", "v" }, desc = "Save selected code snapshot" },
  },
  opts = {
    save_path = "~/Pictures/Codesnap/",
    has_breadcrumbs = true,
    bg_theme = "bamboo",
  },
}
