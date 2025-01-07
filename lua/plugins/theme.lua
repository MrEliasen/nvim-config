require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    term_colors = true,
    transparent_background = false,
    no_italic = false,
    no_bold = false,
    color_overrides = {
        mocha = {
            base = "#000000",
            base2 = "#3b4261",
        },
    },
    highlight_overrides = {
        mocha = function(C)
            return {
                --   TabLineSel = { bg = C.pink },
                NvimTreeNormal = { bg = C.none },
                TelescopeBorder = { link = "FloatBorder" },
                CmpBorder = { fg = C.surface2 },
                Pmenu = { bg = C.none },

                NormalFloat = { bg = C.base2, fg = C.text }, -- Set a solid background for floating windows
                FloatBorder = { bg = C.base2, fg = C.surface2 }, -- Set border colors for float
                LspSignatureActiveParameter = { bg = C.mantle, fg = C.text }, -- Highlight active signature parameter
            }
        end,
    },
    integrations = {
        cmp = true,
        nvimtree = true,
        treesitter = true,
        lsp_trouble = true,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
                ok = { "italic" },
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
                ok = { "underline" },
            },
            inlay_hints = {
                background = true,
            },
        },
    },
})

vim.cmd.colorscheme("catppuccin")
