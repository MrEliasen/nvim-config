local mason = require("mason")
local mason_lsp = require("mason-lspconfig")
local cmp_lsp = require("cmp_nvim_lsp")
local util = require 'lspconfig.util'

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
        enable_inlay_hints_params = true,
        enable_inlay_hints_default_params = true,
        enable_inlay_hints_implicit_return = true,
        enable_checker_only_saved = true,
        enable_auto_import = true,
        checker_args = "-strict-style",
        collections = {}
    },
});

vim.lsp.config.tailwindcss = {
    cmd = {
        "tailwindcss-language-server",
        "--stdio"
    },
    filetypes = {
        "gohtml",
        "html",
        "markdown",
        "twig",
        "css",
        "less",
        "postcss",
        "sass",
        "scss",
        "javascript",
        "typescript",
        "vue",
        "svelte",
        "blade",
        "php",
    },
    root_pattern = {
        'tailwind.config.js',
        'tailwind.config.ts',
        'postcss.config.js',
        'postcss.config.ts',
        'package.json',
        'node_modules',
        '.git'
    },
    settings = {
        tailwindCSS = {
            classAttributes = { "class", "className", "classList", "ngClass" },
            lint = {
                cssConflict = "warning",
                invalidApply = "error",
                invalidConfigPath = "error",
                invalidScreen = "error",
                invalidTailwindDirective = "error",
                invalidVariant = "error",
                recommendedVariantOrder = "warning"
            },
            validate = true
        }
    }
}

vim.lsp.config("intelephense", {
    cmd = { "intelephense", "--stdio" },
    filetypes = { "php", "blade", "php_only" },
    root_pattern = { 'composer.json', '.git' }
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

vim.lsp.config("ts_ls", {
    init_options = {
        plugins = {
            {
                name = "@vue/typescript-plugin",
                location = "/Users/markeliasen/.nvm/versions/node/v25.1.0/lib/node_modules/@vue/typescript-plugin",
                -- which node
                -- npm install --global @vue/typescript-plugin
                languages = { "javascript", "typescript", "vue" },
            },
        },
    },
    filetypes = {
        "javascript",
        "typescript",
        "vue",
    },
})
