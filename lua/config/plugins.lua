return {
    -- Theme Files
    { "catppuccin/nvim",            name = "catppuccin", priority = 1000 },
    { "nvim-tree/nvim-web-devicons" },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        dependencies = {
            {
                "JoosepAlviste/nvim-ts-context-commentstring",
                opts = {
                    custom_calculation = function(_, language_tree)
                        if vim.bo.filetype == "blade" and language_tree._lang ~= "javascript" and language_tree._lang ~= "php" then
                            return "{{-- %s --}}"
                        end
                    end,
                },
            },
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        config = function(_, opts)
            ---@class ParserInfo[]
            local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
            parser_config.blade = {
                install_info = {
                    url = "https://github.com/EmranMR/tree-sitter-blade",
                    files = {
                        "src/parser.c",
                        -- 'src/scanner.cc',
                    },
                    branch = "main",
                    generate_requires_npm = true,
                    requires_generate_from_grammar = true,
                },
                filetype = "blade",
            }

            require("nvim-treesitter.configs").setup(opts)
        end,
    },

    -- telescope
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },

    -- Completions (CMP)
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-calc",
            "onsails/lspkind.nvim",
        }
    },

    -- navigation
    { 'akinsho/bufferline.nvim', version = "*",       dependencies = 'nvim-tree/nvim-web-devicons' },
    { "ThePrimeagen/harpoon",    branch = "harpoon2", dependencies = { "nvim-lua/plenary.nvim" } },

    -- LSP
    --[[ {
        "github/copilot.vim"
    }, ]]
    {
        "mfussenegger/nvim-dap",
    },
    {
        "leoluz/nvim-dap-go",
    },
    {
        "aznhe21/actions-preview.nvim",
    },
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    {
        "neovim/nvim-lspconfig",
    },
    {
        "stevearc/conform.nvim"
    },
    {
        "ziglang/zig.vim",
    },
    {
        "smjonas/inc-rename.nvim",
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp"
    },
    {
        "fatih/vim-go"
    },

    --formatter
    --[[ {
        "prettier/vim-prettier",
        build = 'npm install --frozen-lockfile --production && npm add -D prettier prettier-plugin-svelte'
    }, ]]

    -- Misc
    { 'akinsho/toggleterm.nvim', version = "*", config = true },
    { 'rcarriga/nvim-notify' },
    {
        'numToStr/Comment.nvim',
        lazy = false,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },
    {
        "j-hui/fidget.nvim",
    },
    {
        'goolord/alpha-nvim',
        config = function()
            require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
        end
    },
    {
        "kevinhwang91/nvim-hlslens"
    },
    {
        "laytan/cloak.nvim"
    }
}
