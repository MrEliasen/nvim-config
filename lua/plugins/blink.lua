return {
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = '1.*',
        opts = function(_, opts)
            opts.keymap = opts.keymap or {}
            opts.keymap.preset = "default"
            opts.keymap["<CR>"] = { "accept", "fallback" }
            opts.keymap['<C-k>'] = { 'select_prev', 'fallback' }
            opts.keymap['<C-j>'] = { 'select_next', 'fallback' }

            opts.completion = opts.completion or {}
            opts.completion.accept = opts.completion.accept or {}
            opts.completion.accept.resolve_timeout_ms = 600

            return opts
        end,
    }
}
