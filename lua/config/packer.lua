local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local packer = require("packer")

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

vim.loader.enable()

return packer.startup(function(use)
    -- Essentials
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")
    use("miversen33/import.nvim")

    -- Navigation
    use("folke/which-key.nvim")

    -- Buffers & navigation
    use("nvim-lualine/lualine.nvim")
    use("lukas-reineke/indent-blankline.nvim")
    use("kevinhwang91/nvim-hlslens")
    use("yamatsum/nvim-cursorline")
    use("brenoprata10/nvim-highlight-colors")
    use("ThePrimeagen/harpoon")

    -- Colorscheme
    use({"catppuccin/nvim", as = "catppuccin" })

    -- Treesitter
    use("nvim-treesitter/nvim-treesitter")

    -- Telescope
    use("nvim-telescope/telescope.nvim")
    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    })

    -- CMP
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("saadparwaiz1/cmp_luasnip")
    use("L3MON4D3/LuaSnip")
    use("hrsh7th/cmp-nvim-lsp")
    use("onsails/lspkind.nvim")
    use("zbirenbaum/copilot.lua")
    use("zbirenbaum/copilot-cmp")

    -- LSP
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use("neovim/nvim-lspconfig")
    use("jose-elias-alvarez/typescript.nvim")
    use("simrat39/symbols-outline.nvim")
    use({"j-hui/fidget.nvim", tag = "legacy"})
    use("ray-x/lsp_signature.nvim")
    use("smjonas/inc-rename.nvim")
    use("folke/trouble.nvim")
    use("simrat39/rust-tools.nvim")

    -- Editing
    use("max397574/better-escape.nvim")
    use("ethanholz/nvim-lastplace")
    use("numToStr/Comment.nvim")
    use("JoosepAlviste/nvim-ts-context-commentstring")

    -- UI
    use("goolord/alpha-nvim")

    -- Misc
    use("akinsho/toggleterm.nvim")
    use("rcarriga/nvim-notify")

    -- Learn VIM
    use("ThePrimeagen/vim-be-good")

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
