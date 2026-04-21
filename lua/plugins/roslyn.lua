return {
	{
		"seblyng/roslyn.nvim",
		ft = "cs",
		---@module "roslyn.config"
		---@type RoslynNvimConfig
		opts = {
			-- optional plugin-level settings
			-- broad_search = true,
			-- filewatching = "roslyn",
		},
		config = function(_, opts)
			vim.lsp.config("roslyn", {
				settings = {
					["csharp|inlay_hints"] = {
						csharp_enable_inlay_hints_for_implicit_object_creation = true,
						csharp_enable_inlay_hints_for_implicit_variable_types = true,
					},
					["csharp|code_lens"] = {
						dotnet_enable_references_code_lens = true,
					},
				},
			})

			require("roslyn").setup(opts)
		end,
	},
}
