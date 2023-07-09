local opts = { noremap = true, silent = true }
local normp = { noremap = true }
local silent = { silent = true }

-- Leader key
vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", normp)
vim.keymap.set("v", ">", ">gv", normp)

-- Move text up and down
vim.keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- searching
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "NFzzzv", opts)

-- find replace word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], normp)

-- open file_browser with the path of the current buffer
vim.keymap.set("n", "<leader>fr", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", normp)