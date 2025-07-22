require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "python", "javascript", "html", "css" },
  highlight = { enable = true },
  indent = { enable = true },
})

