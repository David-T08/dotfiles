local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Telescope
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" }, config = function()
    require("plugins.configs.telescope")
  end },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", lazy = false, branch = "master", build = ":TSUpdate", config = function()
    require("plugins.configs.treesitter")
  end },

  -- File Explorer
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },

  -- Statusline
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

  -- LSP Config
  { "neovim/nvim-lspconfig" },

  -- Completion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },

  -- Snippets
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },

  -- Git signs
  { "lewis6991/gitsigns.nvim" },

  -- Rust support
  { "simrat39/rust-tools.nvim" },

  -- Debugging (DAP)
  { "mfussenegger/nvim-dap" },

  -- Colorscheme
  { "datsfilipe/vesper.nvim", lazy = false, priority = 1000, config = function()
    vim.cmd.colorscheme("vesper")
  end },
})
