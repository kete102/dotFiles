return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      menu = {
        winblend = vim.o.pumblend,
      },
    },
    signature = {
      window = {
        winblend = vim.o.pumblend,
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
  },
}
