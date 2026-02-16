local function root(patterns)
	return function(bufnr, cb)
		local fname = vim.api.nvim_buf_get_name(bufnr)
		local r = vim.fs.root(fname, patterns)
		cb(r or vim.fn.getcwd())
	end
end

-- Common client capabilities (works fine without cmp; extend later if you add cmp)
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- LUA
vim.lsp.config("lua_ls", {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_dir = root({ ".git", ".luarc.json", ".luarc.jsonc" }),
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
	capabilities = capabilities,
})
vim.lsp.enable("lua_ls")

-- GO
vim.lsp.config("gopls", {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gosum", "gotmpl" },
	root_dir = root({ "go.work", "go.mod", ".git" }),
	settings = {
		gopls = {
			gofumpt = true,
			staticcheck = true,
			analyses = {
				unusedparams = true,
				nilness = true,
				unusedwrite = true,
				useany = true,
			},
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
		},
	},
	capabilities = capabilities,
})
vim.lsp.enable("gopls")

-- PHP / Laravel
vim.lsp.config("intelephense", {
	cmd = { "intelephense", "--stdio" },
	filetypes = { "php", "blade" },
	root_dir = root({ "composer.json", "artisan", ".git" }),
	settings = {
		intelephense = {
			files = {
				maxSize = 5000000,
			},
			format = { enable = false },
			completion = {
				insertUseDeclaration = true,
				triggerParameterHints = true,
			},
		},
	},
	capabilities = capabilities,
})
vim.lsp.enable("intelephense")

vim.lsp.config("phpactor", {
	cmd = { "phpactor", "language-server" },
	filetypes = { "php", "blade" },
	root_dir = root({ "composer.json", ".git" }),
	root_markers = { ".git", "composer.json", ".phpactor.json", ".phpactor.yml" },
	workspace_required = true,
	init_options = {
		["language_server_phpstan.enabled"] = false,
		["language_server_psalm.enabled"] = false,
	},
	capabilities = capabilities,
})
--vim.lsp.enable("phpactor")

-- Odin
vim.lsp.config("ols", {
	cmd = { "ols" },
	filetypes = { "odin" },
	root_dir = root({ "ols.json", "odinfmt.json" }),
	init_options = {
		enable_semantic_tokens = true,
		enable_document_symbols = true,
		newline_limit = 2,
		character_width = 100,
		enable_hover = true,
		enable_snippets = true,
		enable_references = true,
		enable_inlay_hints_params = true,
		enable_inlay_hints_default_params = true,
		enable_inlay_hints_implicit_return = true,
		enable_checker_only_saved = false,
		enable_auto_import = true,
		checker_args = "-vet -vet-cast -vet-semicolon -vet-using-param",
		collections = {},
	},
	capabilities = capabilities,
})
vim.lsp.enable("ols")

-- TS/JS (vtsls)
vim.lsp.config("vtsls", {
	cmd = { "vtsls", "--stdio" },
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	root_dir = root({ "package.json", "tsconfig.json", "jsconfig.json", ".git" }),
	capabilities = capabilities,
})
vim.lsp.enable("vtsls")

-- Vue (Volar / vue-language-server)
vim.lsp.config("vue_ls", {
	cmd = { "vue-language-server", "--stdio" },
	filetypes = { "vue" },
	root_dir = root({ "package.json", "tsconfig.json", "jsconfig.json", ".git" }),
	capabilities = capabilities,
})
vim.lsp.enable("vue_ls")

-- JSON (jsonls)
vim.lsp.config("jsonls", {
	cmd = { "json-language-server", "--stdio" },
	filetypes = { "json", "jsonc" },
	capabilities = capabilities,
})
vim.lsp.enable("jsonls")

-- Dockerfile (dockerfile-language-server)
vim.lsp.config("dockerfile-language-server", {
	cmd = { "docker-langserver", "--stdio" },
	filetypes = { "Dockerfile", "dockerfile" },
	capabilities = capabilities,
})
vim.lsp.enable("dockerfile-language-server")

-- Docker compose (docker-compose-language-service)
vim.lsp.config("docker-compose-language-service", {
	cmd = { "docker-compose-langserver", "--stdio" },
	filetypes = { "yaml.docker-compose" },
	capabilities = capabilities,
})
vim.lsp.enable("docker-compose-language-service")
