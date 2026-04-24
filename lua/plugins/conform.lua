return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			format_on_save = false,

			formatters_by_ft = {
				javascript = { "prettierd", "prettier" },
				javascriptreact = { "prettierd", "prettier" },
				typescript = { "prettierd", "prettier" },
				typescriptreact = { "prettierd", "prettier" },
				vue = { "prettierd", "prettier" },
				json = { "prettierd", "prettier" },
				jsonc = { "prettierd", "prettier" },
				yaml = { "prettierd", "prettier" },
				html = { "prettierd", "prettier" },
				css = { "prettierd", "prettier" },
				scss = { "prettierd", "prettier" },
				markdown = { "prettierd", "prettier" },
				go = { "goimports", "gofumpt" },
				lua = { "stylua" },
				php = { "pint", "php_cs_fixer" },
				dart = { "dart_format" },
				odin = { "odinfmt" },
			},

			formatters = {
				prettierd = {
					prefer_local = "node_modules/.bin",
				},
				prettier = {
					prefer_local = "node_modules/.bin",
				},
				pint = {
					prefer_local = "vendor/bin",
				},
				php_cs_fixer = {
					prefer_local = "vendor/bin",
				},
				odinfmt = {
					command = "odinfmt",
					args = { "-stdin" },
					stdin = true,
				},
			},
		},
	},
}
