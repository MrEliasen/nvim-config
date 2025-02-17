local mason = require("mason")
local mason_lsp = require("mason-lspconfig")
local cmp_lsp = require("cmp_nvim_lsp")

require'lspconfig'.protols.setup{}
--[[ lspconfig.gdscript.setup {
    force_setup = true, -- because the LSP is global. Read more on lsp-zero docs about this.
    single_file_support = false,
    -- cmd = {'ncat', '127.0.0.1', '6008'}, -- the important trick for Windows!
    root_dir = require('lspconfig.util').root_pattern('project.godot', '.git'),
    filetypes = {'gd', 'gdscript', 'gdscript3' }
} ]]

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

mason_lsp.setup_handlers({
    function(server_name)
        local has_custom_opts, custom_opts = pcall(require, "config.lsp.settings." .. server_name)

        local server_opts = opts

        if has_custom_opts then
            server_opts = vim.tbl_deep_extend("force", custom_opts, opts)
        end

        require("lspconfig")[server_name].setup(server_opts)
    end,
    ["ols"] = function()
        require("lspconfig").ols.setup({
            init_options = {
                enable_hover = true,
                enable_snippets = true,
                enable_semantic_tokens = true,
                enable_document_symbols = true,
                enable_checker_only_saved = false,
                collections = {
                    { name = "thirdparty", path = vim.fn.expand('$HOME/Projects/ooga-booga/untitled/output') }
                },
            },
        })
    end,
    ["lua_ls"] = function()
        require("lspconfig").lua_ls.setup({
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
    end,
    ["phpactor"] = function()
        require("lspconfig").phpactor.setup({
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
    end,
    ["gopls"] = function()
        require("lspconfig").gopls.setup({
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
    end,
})
