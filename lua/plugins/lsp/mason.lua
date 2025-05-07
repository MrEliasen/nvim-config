local mason = require("mason")
local mason_lsp = require("mason-lspconfig")
local cmp_lsp = require("cmp_nvim_lsp")

require 'lspconfig'.protols.setup {}
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
        enable_hover = true,
        enable_snippets = true,
        enable_semantic_tokens = true,
        enable_document_symbols = true,
        enable_checker_only_saved = true,
        collections = {
            { name = "thirdparty", path = vim.fn.expand('$HOME/Projects/ooga-booga/arena/additional-libs') }
        },
    },
});

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

vim.lsp.config("phpactor", {
    init_options = {
        ["language_server_phpstan.enabled"] = false,
    },
    settings = {
        phpactor = {
            diagnostics = {
                phpstan = {
                    enabled = false, -- Disable PHPStan diagnostics (syntax errors)
                },
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
