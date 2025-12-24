require("nvim-treesitter").setup({
    ensure_installed = {
        "markdown",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "svelte",
        "odin",
        "scss",
        "c",
        "python",
        "php",
        "php_only",
        "java",
        "astro",
        "vue",
        "dockerfile",
        "yaml",
        "toml",
    },
    sync_install = true,
    auto_install = true,
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
    },
    context_commentstring = {
        enable = true,
        config = {
            javascriptreact = {
                style_element = '{/*%s*/}'
            }
        }
    },
    refactor = {
        highlight_definitions = { enable = true }
    },
})
