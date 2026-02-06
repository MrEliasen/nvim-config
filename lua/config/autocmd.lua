local aug = vim.api.nvim_create_augroup
local aucmd = vim.api.nvim_create_autocmd
local grp = aug("user_filetype_indent", { clear = true })

-- Odin
aucmd({ "BufRead", "BufNewFile" }, {
    group = grp,
    pattern = "*.odin",
    callback = function()
        vim.bo.filetype = "odin"
    end,
})

-- Laravel Blade
aucmd({ "BufRead", "BufNewFile" }, {
    group = grp,
    pattern = "*.blade.php",
    callback = function()
        vim.bo.filetype = "blade"
        vim.bo.shiftwidth = 4
        vim.bo.tabstop = 4
        vim.bo.softtabstop = 4
        vim.bo.expandtab = true
    end,
})

-- 2-space ecosystems
aucmd("FileType", {
    group = grp,
    pattern = { "dart", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "json", "yaml", "css", "scss", "html" },
    callback = function()
        vim.bo.shiftwidth = 2
        vim.bo.tabstop = 2
        vim.bo.softtabstop = 2
        vim.bo.expandtab = true
    end,
})

-- Go
aucmd("FileType", {
    group = grp,
    pattern = { "go" },
    callback = function()
        vim.bo.expandtab = false
        vim.bo.tabstop = 8
        vim.bo.shiftwidth = 0
        vim.bo.softtabstop = 0
    end,
})

-- PHP (4 spaces)
aucmd("FileType", {
    group = grp,
    pattern = { "php", "blade" },
    callback = function()
        vim.bo.shiftwidth = 4
        vim.bo.tabstop = 4
        vim.bo.softtabstop = 4
        vim.bo.expandtab = true
    end,
})
