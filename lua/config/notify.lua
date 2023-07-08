import("notify", function(notify)
    notify.setup({
        timeout = 1500,
    })
    vim.notify = notify
end)
