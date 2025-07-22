vim.g.mapleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Save and quit
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)

-- File explorer (assuming NvimTree or netrw)
map("n", "<leader>e", ":Ex<CR>", opts)  -- replace with :NvimTreeToggle<CR> if you install it

-- Telescope (once you install it)
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)

