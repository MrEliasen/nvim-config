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
    use("nvim-lua/plenary.nvim") -- lua functions
    use("miversen33/import.nvim") -- depreciated import lib
    use('nvim-tree/nvim-web-devicons') -- Icons

    -- Navigation
    use("folke/which-key.nvim") -- key mapping

    -- Buffers & navigation
    use("nvim-lualine/lualine.nvim") -- footer
    use("lukas-reineke/indent-blankline.nvim") -- indent guides
    use("kevinhwang91/nvim-hlslens") -- search highlight
    use("yamatsum/nvim-cursorline") -- cursor word highlight
    use("brenoprata10/nvim-highlight-colors") -- highlights colours
    use("ThePrimeagen/harpoon") -- Harpoon Man's bible
    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'} -- tabs/buffer visualiser

    -- Colorscheme
    use({"catppuccin/nvim", as = "catppuccin" }) -- Theme

    -- Treesitter
    use("nvim-treesitter/nvim-treesitter") -- syntax highlighter

    -- Telescope
    use("nvim-telescope/telescope.nvim") -- file search
    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    }) -- fuzzy file search
    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    } -- file browser for telescope

    -- CMP
    use("hrsh7th/nvim-cmp") -- completion
    use("hrsh7th/cmp-buffer") -- buffer completion
    use("hrsh7th/cmp-path") -- path completion
    use("hrsh7th/cmp-cmdline") -- cmd line completion
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip") -- lua snippet completion
    use("hrsh7th/cmp-nvim-lsp") -- completion integration with lsp
    use("onsails/lspkind.nvim") -- lsp pictograms
    use("zbirenbaum/copilot.lua") -- copilot
    use("zbirenbaum/copilot-cmp") -- copilot completions

    -- LSP
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use("neovim/nvim-lspconfig")
    use("jose-elias-alvarez/typescript.nvim")
    use("simrat39/symbols-outline.nvim")
    use({"j-hui/fidget.nvim", tag = "legacy"})
    use("smjonas/inc-rename.nvim")
    use({
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	})
    use("folke/trouble.nvim")
    use("simrat39/rust-tools.nvim")
    use('jose-elias-alvarez/null-ls.nvim')
    use("jayp0521/mason-null-ls.nvim")
    use {"gbprod/phpactor.nvim",
      -- run = require("phpactor.handler.update"), -- To install/update phpactor when installing this plugin
      requires = {
        "nvim-lua/plenary.nvim", -- required to update phpactor
        "neovim/nvim-lspconfig" -- required to automaticly register lsp serveur
      }
    }

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

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
