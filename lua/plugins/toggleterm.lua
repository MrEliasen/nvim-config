local toggleterm = require("toggleterm")

toggleterm.setup({
    open_mapping = [[<C-\>]],
    terminal_mappings = true,
    insert_mappings = true,
    shade_terminals = false,
    start_in_insert = true,
    direction = "float",
})

function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
