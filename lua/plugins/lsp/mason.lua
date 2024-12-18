local mason = require("mason")
local mason_lsp = require("mason-lspconfig")
local cmp_lsp = require("cmp_nvim_lsp")
-- local lspconfig = require('lspconfig')

--[[ lspconfig.gdscript.setup {
    force_setup = true, -- because the LSP is global. Read more on lsp-zero docs about this.
    single_file_support = false,
    -- cmd = {'ncat', '127.0.0.1', '6008'}, -- the important trick for Windows!
    root_dir = require('lspconfig.util').root_pattern('project.godot', '.git'),
    filetypes = {'gd', 'gdscript', 'gdscript3' }
} ]]

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
    ensure_installed = {
        "antlers-language-server",
        "bash-language-server",
        "blade-formatter",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "dot-language-server",
        "emmet-ls",
        "flake8",
        "html-lsp",
        "intelephense",
        "nginx-language-server",
        "php-debug-adapter",
        "phpstan",
        "pint",
        "prettierd",
        "gopls",
        "lua_ls",
        "jsonls",
        "eslint",
        "tailwindcss",
        "cssls",
        "bashls",
        "svelte-language-server",
        "tailwindcss-language-server",
    },
})

mason_lsp.setup({
    -- A list of servers to automatically install if they're not already installed
    ensure_installed = {
        "lua_ls",
        "jsonls",
        "eslint",
        "prismals",
        "tailwindcss",
        "html",
        "intelephense",
        "phpactor",
        "gopls",
        "cssls",
        "bashls",
        "svelte",
        "yamlls",
        "dockerls",
        "marksman",
        "stimulus_ls"
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
