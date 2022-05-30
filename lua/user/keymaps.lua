local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Better window navigation
keymap("n", "H", "<C-w>h", opts)
keymap("n", "J", "<C-w>j", opts)
keymap("n", "K", "<C-w>k", opts)
keymap("n", "L", "<C-w>l", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>t", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>g", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>e", "<cmd>:NvimTreeToggle<cr>", opts)

-- Bufferline keymaps
keymap("n", "<leader>l", "<cmd>:BufferLineCycleNext<cr>", opts)
keymap("n", "<leader>h", "<cmd>:BufferLineCyclePrev<cr>", opts)
keymap("n", "<leader>k", "<cmd>:BufferLineMoveNext<cr>", opts)
keymap("n", "<leader>j", "<cmd>:BufferLineMovePrev<cr>", opts)
keymap("n", "<leader>c", "<cmd>:q<cr>", opts)
keymap("n", "<leader>s", "<cmd>:w<cr>", opts)

