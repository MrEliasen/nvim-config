local mason = require("mason")
local mason_lsp = require("mason-lspconfig")
local cmp_lsp = require("cmp_nvim_lsp")

--require 'lspconfig'.protols.setup {}

mason.setup({})
mason_lsp.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
    -- A list of servers to automatically install if they're not already installed
    ensure_installed = {
        "bashls",
        "cssls",
        "dockerls",
        "eslint",
        "gopls",
        "html",
        "intelephense",
        "jsonls",
        "lua_ls",
        "marksman",
        "ols",
        "phpactor",
        "svelte",
        "tailwindcss",
        "yamlls",
    },
    automatic_installation = true,
})

local opts = {
    capabilities = cmp_lsp.default_capabilities(),
}

vim.lsp.config('ols', {
    init_options = {
        enable_semantic_tokens = true,
        enable_document_symbols = true,
        enable_hover = true,
        enable_snippets = true,
        enable_references = true,
        enable_checker_only_saved = true,
        collections = {
            { name = "bald", path = "/Users/markeliasen/Projects/ooga-booga/games/LATEST/client/bald" },
            { name = "user", path = "/Users/markeliasen/Projects/ooga-booga/games/LATEST/client/bald-user" }
        }
    },
});


vim.lsp.config("intelephense", {
    filetypes = { "php", "blade", "php_only" },
    files = {
        associations = { "*.php", "*.blade.php" },
        maxSize = 5000000,
    },
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

vim.lsp.config("gopls", {
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
        },
    },
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
})
