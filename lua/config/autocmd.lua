vim.filetype.add({
	extension = {
		odin = "odin",
		gosum = "gosum",
		gotmpl = "gotmpl",
	},
	filename = {
		["docker-compose.yml"] = "yaml.docker-compose",
		["docker-compose.yaml"] = "yaml.docker-compose",
		["compose.yml"] = "yaml.docker-compose",
		["compose.yaml"] = "yaml.docker-compose",
	},
	pattern = {
		[".*%.blade%.php"] = "blade",
	},
})

vim.treesitter.language.register("yaml", { "yaml.docker-compose" })

local aug = vim.api.nvim_create_augroup
local aucmd = vim.api.nvim_create_autocmd
local grp = aug("user_filetype_indent", { clear = true })

-- 2-space ecosystems
aucmd("FileType", {
	group = grp,
	pattern = {
		"dart",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"vue",
		"json",
		"yaml",
		"css",
		"scss",
		"html",
	},
	callback = function()
		vim.bo.shiftwidth = 2
		vim.bo.tabstop = 2
		vim.bo.softtabstop = 2
		vim.bo.expandtab = true
	end,
})

-- Go
aucmd("FileType", {
	group = grp,
	pattern = { "go" },
	callback = function()
		vim.bo.expandtab = false
		vim.bo.tabstop = 4
		vim.bo.shiftwidth = 4
		vim.bo.softtabstop = 4
	end,
})

-- PHP + Blade (4 spaces)
aucmd("FileType", {
	group = grp,
	pattern = { "php", "blade" },
	callback = function()
		vim.bo.shiftwidth = 4
		vim.bo.tabstop = 4
		vim.bo.softtabstop = 4
		vim.bo.expandtab = true
	end,
})

-- Spell only for prose filetypes
aucmd("FileType", {
	group = grp,
	pattern = { "markdown", "gitcommit", "text", "help" },
	callback = function()
		vim.opt_local.spell = true
	end,
})
