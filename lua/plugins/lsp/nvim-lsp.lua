local nvimlsp = require("lspconfig")

nvimlsp.intelephense.setup({
    -- @type lspconfig.options
    servers = {
        intelephense = {
            filetypes = { "php", "blade", "php_only" },
            settings = {
                intelephense = {
                    filetypes = { "php", "blade", "php_only" },
                    files = {
                        associations = { "*.php", "*.blade.php" },         -- Associating .blade.php files as well
                        maxSize = 5000000,
                    },
                },
            },
        },
    },
})
