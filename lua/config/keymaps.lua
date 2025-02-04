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

-- Navigate buffers
vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)
vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)

-- open file_browser with the path of the current buffer
-- vim.keymap.set("n", "<leader>fr", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", normp)

-- copilot
--[[ vim.keymap.set('i', '<C-a>', 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false
})
vim.g.copilot_no_tab_map = true ]]
