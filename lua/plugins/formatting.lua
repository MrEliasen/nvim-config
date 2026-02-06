return {
    {
        "stevearc/conform.nvim",
        opts = function(_, opts)
            opts.formatters_by_ft = opts.formatters_by_ft or {}
            opts.formatters = opts.formatters or {}

            opts.formatters.prettierd = vim.tbl_deep_extend("force", opts.formatters.prettierd or {}, {
                prefer_local = "node_modules/.bin",
            })
            opts.formatters.prettier = vim.tbl_deep_extend("force", opts.formatters.prettier or {}, {
                prefer_local = "node_modules/.bin",
            })
            opts.formatters.pint = vim.tbl_deep_extend("force", opts.formatters.pint or {}, {
                prefer_local = "vendor/bin",
            })
            opts.formatters.php_cs_fixer = vim.tbl_deep_extend("force", opts.formatters.php_cs_fixer or {}, {
                prefer_local = "vendor/bin",
            })

            -- Go
            opts.formatters_by_ft.go = { "goimports", "gofumpt" }

            -- PHP
            opts.formatters_by_ft.php = { "pint", "php_cs_fixer" }

            -- JS
            for _, ft in ipairs({ "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" }) do
                opts.formatters_by_ft[ft] = { "prettierd", "prettier" }
            end

            -- Dart
            opts.formatters_by_ft.dart = { "dart_format" }

            -- Odin
            opts.formatters.odinfmt = {
                command = "odinfmt",
                args = { "-stdin" },
                stdin = true,
            }
            opts.formatters_by_ft.odin = { "odinfmt" }
        end,
    },
}
