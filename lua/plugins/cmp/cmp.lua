local lspkind = require('lspkind')
local cmp = require("cmp")
local luasnip = require("luasnip")
local luasnip_vscode = require("luasnip/loaders/from_vscode")
luasnip_vscode.lazy_load()

local check_backspace = function()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    },
})

cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
    }),
})

require("cmp").setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif check_backspace() then
                fallback()
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
    },
    formatting = {
        fields = { "abbr", "kind", "menu" },
        format = lspkind.cmp_format({
            mode = 'symbol', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                           -- can also be a function to dynamically calculate max width such as 
                           -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            show_labelDetails = true, -- show labelDetails in menu. Disabled by default
            before = function(entry, vim_item)
                vim_item.menu = ({
                    nvim_lsp = "[LSP]",
                    luasnip = "[Snippet]",
                    buffer = "[Buffer]",
                    path = "[Path]",
                })[entry.source.name]
                return vim_item
            end,
        })
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
        -- { name = "copilot" },
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    experimental = {
        ghost_text = false,
        native_menu = false,
    },
    --performance = {
    --   debounce = 150,
    --},
})
