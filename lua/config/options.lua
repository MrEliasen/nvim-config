local options = {
    autoindent = true,
    backup = false,
    cmdheight = 1,
    completeopt = { "menuone", "noselect" },
    conceallevel = 0,
    cursorline = true,
    colorcolumn = "120",
    expandtab = true,
    fileencoding = "utf-8",
    guicursor = "",
    hlsearch = true,
    ignorecase = true,
    laststatus = 3,
    mouse = "a",
    number = true,
    numberwidth = 4,
    pumheight = 10,
    relativenumber = true,
    scrolloff = 8,
    shiftwidth = 4,
    showmode = false,
    showtabline = 4,
    sidescrolloff = 8,
    signcolumn = "yes",
    smartcase = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    tabstop = 4,
    softtabstop = 4,
    termguicolors = true,
    undofile = true,
    updatetime = 50,
    wrap = false,
    writebackup = false,
    hidden = true,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set t_Co=256]])

vim.opt.shortmess:append("c")
