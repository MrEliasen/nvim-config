require("bufferline").setup({
    options = {
        buffer_close_icon = "",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(_, level)
            local icon = level:match("error") and " " or ""
            return " " .. icon
        end,
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = "thick",
        offsets = {
            {
                filetype = "neo-tree",
                text = "File Explorer",
                padding = 2,
            },
        },
    },
})
