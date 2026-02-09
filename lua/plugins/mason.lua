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
        "dockerls",
        "eslint-lsp",
        "gofumpt",
        "goimports",
        "gopls",
        "html",
        "intelephense",
        "jsonls",
        "lua_ls",
        "marksman",
        "ols",
        "prettierd",
        "svelte",
        "tailwindcss",
        "vtsls",
        "vue-language-server",
        "yamlls",
      },
      auto_update = false,
      run_on_start = true,
      start_delay = 2000, -- ms, avoids slowing startup
      debounce_hours = 12,
    },
  },
}
