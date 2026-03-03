return {
	{
		"mason-org/mason.nvim",
		build = ":MasonUpdate",
		opts = {},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"bash-language-server",
				"css-lsp",
				"dockerfile-language-server",
				"eslint-lsp",
				"gofumpt",
				"goimports",
				"gopls",
				"html-lsp",
				"intelephense",
				"lua-language-server",
				"marksman",
				"ols",
				"prettierd",
				"tailwindcss-language-server",
				"vtsls",
				"vue-language-server",
				"yaml-language-server",
			},
			auto_update = false,
			run_on_start = true,
			start_delay = 2000, -- ms, avoids slowing startup
			debounce_hours = 12,
		},
	},
}
