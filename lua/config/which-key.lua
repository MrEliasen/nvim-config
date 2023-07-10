import("which-key", function(whichKey)
    local setup = {
        window = {
            border = "rounded",
            position = "bottom",
            margin = { 1, 0, 1, 0 },
            padding = { 2, 2, 2, 2 },
            winblend = 0,
        },
        ignore_missing = true,
        hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
        show_help = true,
    }

    local opts = {
        mode = "n",
        prefix = "<leader>",
        silent = true,
        noremap = true,
    }

    local mappings = {
        ["w"] = { "<cmd>w<cr>", "Save" },
        ["q"] = { "<cmd>q<cr>", "Quit" },
        ["p"] = {
            name = "Project",
            ["k"] = {
                name = "Packer",
                ["s"] = { "<cmd>PackerSync<CR>", "Sync" },
                ["i"] = { "<cmd>PackerInstall<CR>", "Install" },
                ["u"] = { "<cmd>PackerUpdate<CR>", "Update" },
                ["c"] = { "<cmd>PackerCompile<CR>", "Compile" },
            },
            ["v"] = { "<cmd>Ex<CR>", "NetRW Explorer" },
        },
        ["f"] = {
            name = "Find",
            ["t"] = { "<cmd>lua require('telescope.builtin').live_grep()<CR>", "Text" },
            ["f"] = { "<cmd>lua require('telescope.builtin').find_files()<CR>", "Files" },
            ["h"] = { "<cmd>lua require('telescope.builtin').help_tags()<CR>", "Help tags" },
            ["b"] = { "<cmd>lua require('telescope').extensions.file_browser.file_browser()<CR>", "Browse Files" },
            ["B"] = { "<cmd>lua require('telescope').extensions.file_browser.file_browser(%:p:h, true)<CR>", "Browse Relative" },
            ["m"] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Marked files" },
        },
        -- ["g"] = {
        --     name = "Git",
        --     ["s"] = { "<cmd>lua require('telescope.builtin').git_status()<CR>", "Status" },
        --     ["c"] = { "<cmd>lua require('telescope.builtin').git_commits()<CR>", "Commits" },
        --     ["b"] = { "<cmd>lua require('telescope.builtin').git_branches()<CR>", "Branches" },
        --     ["d"] = {
        --         name = "Diff view",
        --         ["o"] = { "<cmd>DiffviewOpen<CR>", "Open" },
        --         ["d"] = { "<cmd>DiffviewClose<CR>", "Close" },
        --         ["l"] = { "<cmd>DiffviewLog<CR>", "Log" },
        --         ["r"] = { "<cmd>DiffviewRefresh<CR>", "Refresh" },
        --         ["f"] = { "<cmd>DiffviewFocusFiles<CR>", "Focus files" },
        --         ["h"] = { "<cmd>DiffviewFileHistory<CR>", "File history" },
        --     },
        -- },
        ["h"] = {
            name = "Harpoon",
            ["e"] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "View Marked Files" },
            ["h"] = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Mark file" },
            ["a"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Nav file 1" },
            ["s"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "Nav file 2" },
            ["d"]  = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Nav file 3" },
            ["f"]  = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "Nav file 4" },
        },
        ["l"] = {
            name = "LSP",
            ["D"] = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Declaration" },
            ["d"] = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Definition" },
            ["T"] = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type definition" },
            ["i"] = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Implementation" },
            ["R"] = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
            ["K"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
            ["k"] = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature help" },
            ["s"] = { "<cmd>SymbolsOutline<cr>", "Toggle symbols outline" },
            ["n"] = { ":IncRename ", "Rename" },
            ["a"] = { "<cmd>CodeActionMenu<cr>", "Code actions" },
            ["f"] = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
            ["l"] = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Open float" },
            ["t"] = {
                name = "TypeScript",
                ["a"] = { "<cmd>TypescriptAddMissingImports<CR>", "Add missing imports" },
                ["o"] = { "<cmd>TypescriptOrganizeImports<CR>", "Organize imports" },
                ["u"] = { "<cmd>TypescriptRemoveUnused<CR>", "Remove unused" },
                ["f"] = { "<cmd>TypescriptFixAll<CR>", "Fix all" },
                ["g"] = { "<cmd>TypescriptGoToSourceDefinition<CR>", "Go to source definition" },
                ["r"] = { "<cmd>TypescriptRenameFile<CR>", "Rename file" },
            },
            ["r"] = {
                name = "Rust",
                ["r"] = { "<cmd>RustRun<cr>", "Run" },
                ["a"] = { "<cmd>RustRunnables<cr>", "Runnables" },
            },
            ["u"] = {
                name = "Trouble",
                r = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
                f = { "<cmd>TroubleToggle lsp_definitions<cr>", "Definitions" },
                d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Diagnostics" },
                q = { "<cmd>TroubleToggle quickfix<cr>", "QuickFix" },
                l = { "<cmd>TroubleToggle loclist<cr>", "LocationList" },
                w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics" },
            },
        }
    }

    whichKey.setup(setup)
    whichKey.register(mappings, opts)
end)
