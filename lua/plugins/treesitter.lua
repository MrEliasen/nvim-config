return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"markdown",
				"html",
				"css",
				"javascript",
				"typescript",
				"json",
				"svelte",
				"odin",
				"scss",
				"c",
				"python",
				"php",
				"vue",
				"dockerfile",
				"yaml",
				"toml",
			},
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		},
		main = "nvim-treesitter.configs",
	},
}
