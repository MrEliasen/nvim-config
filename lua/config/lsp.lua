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
  root_dir = root({ "composer.json", ".git" }),
  settings = {
    intelephense = {
      files = { maxSize = 5000000 },
      format = { enable = false },
    },
  },
  capabilities = capabilities,
})
vim.lsp.enable("intelephense")

-- Odin
vim.lsp.config("ols", {
  cmd = { "ols" },
  filetypes = { "odin" },
  root_dir = root({ ".git" }),
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
