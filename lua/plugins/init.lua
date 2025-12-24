return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000
    },
    {
        "nvim-tree/nvim-web-devicons"
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.parsers').blade = {
                install_info = {
                    url = "https://github.com/EmranMR/tree-sitter-blade",
                    files = { "src/parser.c" },
                    branch = "main",
                },
                filetype = "blade",
            }

            vim.filetype.add({
                pattern = {
                    ['.*%.blade%.php'] = 'blade',
                }
            })
        end,
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = 'v0.2.0',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install' },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim"
        }
    },
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        'hrsh7th/nvim-cmp',
        opts = function(_, opts)
            opts.sources = opts.sources or {}
            table.insert(opts.sources, {
                name = "lazydev",
                group_index = 0,
            })
        end,
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
    { 'akinsho/bufferline.nvim',                  version = "*",                                                                                                  dependencies = 'nvim-tree/nvim-web-devicons' },
    { "ThePrimeagen/harpoon",                     branch = "harpoon2",                                                                                            dependencies = { "nvim-lua/plenary.nvim" } },
    {
        'nvim-flutter/flutter-tools.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        config = true,
    },
    {
        "neovim/nvim-lspconfig",
    },
    {
        "mason-org/mason.nvim", opts = {}
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
    {
        "aznhe21/actions-preview.nvim",
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
    { 'akinsho/toggleterm.nvim', version = "*", config = true },
    {
        'numToStr/Comment.nvim',
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = false
            vim.o.timeoutlen = 0
        end,
        opts = {
            delay = 0,
        }
    },
    {
        "j-hui/fidget.nvim",
    },
    {
        'goolord/alpha-nvim',
        config = function()
        end
    },
    {
        "goolord/alpha-nvim",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local startify = require("alpha.themes.startify")
            startify.file_icons.provider = "devicons"
            require("alpha").setup(
                startify.config
            )
        end,
    },
    {
        "kevinhwang91/nvim-hlslens"
    },
    {
        "laytan/cloak.nvim"
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim', 'nvim-tree/nvim-web-devicons' }, -- if you use the mini.nvim suite
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    }
}
