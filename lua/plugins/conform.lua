return {
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            -- optional: enable format-on-save
            -- format_on_save = function()
            --     return { lsp_fallback = true, timeout_ms = 2000 }
            -- end,

            formatters_by_ft = {
                javascript = { "prettierd", "prettier" },
                javascriptreact = { "prettierd", "prettier" },
                typescript = { "prettierd", "prettier" },
                typescriptreact = { "prettierd", "prettier" },
                vue = { "prettierd", "prettier" },
                json = { "prettierd", "prettier" },
                jsonc = { "prettierd", "prettier" },
                yaml = { "prettierd", "prettier" },
                html = { "prettierd", "prettier" },
                css = { "prettierd", "prettier" },
                scss = { "prettierd", "prettier" },
                markdown = { "prettierd", "prettier" },
                go = { "goimports", "gofumpt" },
                lua = { "stylua" },
                php = { "pint", "php_cs_fixer" },
                dart = { "dart_format" },
            },

            formatters = {
                prettierd = {
                    prefer_local = "node_modules/.bin",
                },
                prettier = {
                    prefer_local = "node_modules/.bin",
                },
                pint = {
                    prefer_local = "vendor/bin",
                },
                php_cs_fixer = {
                    prefer_local = "vendor/bin",
                },
            },
        },
    },
}
