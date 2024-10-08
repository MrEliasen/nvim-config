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
        ["s"] = {
            name = "Search & Replace",
            ["c"] = { "<cmd>:let @/=''<CR>", "Clear" },
            ["s"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "File Replace Word" },
            ["d"] = { [[:.,.+25s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Next 25L - Replace Word" },
            ["f"] = { [[:.,.+0s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Same Line - Replace Word" },
        },
        ["p"] = {
            name = "Project",
            ["k"] = {
                name = "Lazy",
                ["s"] = { "<cmd>Lazy sync<CR>", "Sync" },
                ["i"] = { "<cmd>Lazy install<CR>", "Install" },
                ["u"] = { "<cmd>Lazy update<CR>", "Update" },
                ["c"] = { "<cmd>Lazy check<CR>", "Check" },
            },
            ["v"] = { "<cmd>Ex<CR>", "NetRW Explorer" },
            ["f"] = {
                name = "Flutter",
                ["r"] = {
                    name = "Reload/Restart",
                    ["r"] = { "<cmd>FlutterHotReload<CR>", "Reload" },
                    ["s"] = { "<cmd>FlutterHotRestart<CR>", "Restart" },
                    ["q"] = { "<cmd>FlutterQuit<CR>", "Stop" },
                },
                ["g"] = { "<cmd>FlutterRun<CR>", "Run" },
                ["t"] = { "<cmd>FlutterTab<CR>", "Move Flutter to tab" },
                ["v"] = { "<cmd>FlutterVisualDebug<CR>", "Toggle Visual Debug" },
            },
        },
        ["f"] = {
            name = "Find",
            ["t"] = { "<cmd>lua require('telescope.builtin').live_grep()<CR>", "Text" },
            ["f"] = { "<cmd>lua require('telescope.builtin').find_files()<CR>", "Files" },
            ["r"] = { "<cmd>lua require('telescope.builtin').resume()<CR>", "Resume last search" },
            ["h"] = { "<cmd>lua require('telescope.builtin').help_tags()<CR>", "Help tags" },
            ["b"] = { "<cmd>lua require('telescope').extensions.file_browser.file_browser()<CR>", "Browse Files" },
            ["B"] = { "<cmd>lua require('telescope').extensions.file_browser.file_browser(%:p:h, true)<CR>", "Browse Relative" },
            ["m"] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Marked files" },
        },
        ["b"] = {
			name = "Buffers",
			["d"] = { "<cmd>bdelete<cr>", "Close Current" },
			["m"] = { "<cmd>BufferLineCloseRight<cr><cmd>BufferLineCloseLeft<cr>", "Close all other" },
			["l"] = { "<cmd>BufferLineCloseRight<cr>", "Close right" },
			["h"] = { "<cmd>BufferLineCloseLeft<cr>", "Close left" },
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
            --["s"] = { "<cmd>SymbolsOutline<cr>", "Toggle symbols outline" },
            ["n"] = { ":IncRename ", "Rename" },
            ["a"] = { "<cmd>lua require('actions-preview').code_actions()<cr>", "Code actions" },
            ["f"] = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
            --["f"] = { "<cmd>:Prettier<cr>", "Format" },
            ["l"] = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Open float" },
            ["h"] = { ":LspRestart<cr>", "Restart LSP Server" },
            ["y"] = { ":LspStart<cr>", "Start LSP Server" },
            ["t"] = {
                name = "TypeScript",
                ["a"] = { "<cmd>TypescriptAddMissingImports<CR>", "Add missing imports" },
                ["o"] = { "<cmd>TypescriptOrganizeImports<CR>", "Organize imports" },
                ["u"] = { "<cmd>TypescriptRemoveUnused<CR>", "Remove unused" },
                ["f"] = { "<cmd>TypescriptFixAll<CR>", "Fix all" },
                ["g"] = { "<cmd>TypescriptGoToSourceDefinition<CR>", "Go to source definition" },
                ["r"] = { "<cmd>TypescriptRenameFile<CR>", "Rename file" },
            },
            ["s"] = {
                name = "Spell Checker",
                ["j"] = { "<cmd>]s<cr>", "Next word" },
                ["k"] = { "<cmd>[s<cr>", "Previous word" },
                ["s"] = { "<cmd>z=<cr>", "Show suggestions" },
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

local wk = require("which-key")
wk.setup(setup)
wk.register(mappings, opts)
