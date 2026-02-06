return {
    {
        "nvim-flutter/flutter-tools.nvim",
        ft = "dart",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "stevearc/dressing.nvim",
        },
        config = function()
            require("flutter-tools").setup({
                ui = { border = "rounded" },
                widget_guides = { enabled = false },
            })
        end,
    },
}
