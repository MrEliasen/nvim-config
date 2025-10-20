require('flutter-tools').setup({
    lsp = {
        settings = {
            dart = {
                lineLength = 100,
            }
        }
    },
    dev_log = {
        enable = true,
        focus_on_open = false,
        notify_errors = false,
        open_cmd = "split"
    }
})
