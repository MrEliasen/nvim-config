vim.api.nvim_create_user_command("LspStopBuffer", function()
    vim.lsp.stop_client(vim.lsp.get_clients({ bufnr = 0 }))
end, {})

vim.api.nvim_create_user_command("LspStopAll", function()
    vim.lsp.stop_client(vim.lsp.get_clients())
end, {})

vim.api.nvim_create_user_command("LspRestartBuffer", function()
    local bufnr = 0
    local clients = vim.lsp.get_clients({ bufnr = bufnr })
    vim.lsp.stop_client(clients)
    vim.defer_fn(function()
        vim.api.nvim_exec_autocmds("FileType", { buffer = bufnr })
    end, 100)
end, {})

return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = false
            vim.o.timeoutlen = 0
        end,
        opts = {
            preset = "helix",
            delay = 0,
            timeoutlen = 0,
            triggers = {
                { "<leader>", mode = { "n", "v" } },
            },
        },
        keys = {
            { "<leader>w",  "<cmd>w<cr>",                                                                          mode = "n", desc = "Save" },
            { "<leader>q",  "<cmd>q<cr>",                                                                          mode = "n", desc = "Quit" },
            { "<leader>s",  group = "Search & Replace" },
            { "<leader>sc", "<cmd>:let @/=''<CR>",                                                                 mode = "n", desc = "Clear" },
            { "<leader>ss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],                                mode = "n", desc = "File Replace Word" },
            { "<leader>sd", [[:.,.+25s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],                           mode = "n", desc = "Next 25L - Replace Word" },
            { "<leader>sf", [[:.,.+0s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],                            mode = "n", desc = "Same Line - Replace Word" },
            { "<leader>p",  group = "Project" },
            { "<leader>pv", "<cmd>Ex<CR>",                                                                         mode = "n", desc = "NetRW Explorer", },
            --{ "<leader>pv", "<cmd>Neotree toggle<cr>", mode = "n", desc = "Explorer" },
            { "<leader>f",  group = "Find" },
            { "<leader>ft", "<cmd>lua require('telescope.builtin').live_grep()<CR>",                               mode = "n", desc = "Text" },
            { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files({ hidden=true })<CR>",               mode = "n", desc = "Files" },
            { "<leader>fr", "<cmd>lua require('telescope.builtin').resume()<CR>",                                  mode = "n", desc = "Resume last search" },
            { "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<CR>",                               mode = "n", desc = "Help tags" },
            { "<leader>fb", "<cmd>lua require('telescope').extensions.file_browser.file_browser()<CR>",            mode = "n", desc = "Browse Files" },
            { "<leader>fB", "<cmd>lua require('telescope').extensions.file_browser.file_browser(%:p:h, true)<CR>", mode = "n", desc = "Browse Relative" },
            { "<leader>m",  group = "Markdown" },
            { "<leader>mm", "<cmd>:RenderMarkdown toggle<cr>",                                                     mode = "n", desc = "Toggle rendering" },
            { "<leader>b",  group = "Buffers" },
            { "<leader>bd", "<cmd>bdelete<cr>",                                                                    mode = "n", desc = "Close Current" },
            { "<leader>bm", "<cmd>BufferLineCloseRight<cr><cmd>BufferLineCloseLeft<cr>",                           mode = "n", desc = "Close all other" },
            { "<leader>bl", "<cmd>BufferLineCloseRight<cr>",                                                       mode = "n", desc = "Close right" },
            { "<leader>bh", "<cmd>BufferLineCloseLeft<cr>",                                                        mode = "n", desc = "Close left" },
            { "<leader>h",  group = "Harpoon" },
            { "<leader>he", "<cmd>lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<cr>",     mode = "n", desc = "View Marked Files" },
            { "<leader>hh", "<cmd>lua require('harpoon'):list():add()<cr>",                                        mode = "n", desc = "Mark file" },
            { "<leader>ha", "<cmd>lua require('harpoon'):list():select(4)<cr>",                                    mode = "n", desc = "Nav file 4" },
            { "<leader>hs", "<cmd>lua require('harpoon'):list():select(3)<cr>",                                    mode = "n", desc = "Nav file 3" },
            { "<leader>hd", "<cmd>lua require('harpoon'):list():select(2)<cr>",                                    mode = "n", desc = "Nav file 2" },
            { "<leader>hf", "<cmd>lua require('harpoon'):list():select(1)<cr>",                                    mode = "n", desc = "Nav file 1" },
            { "<leader>l",  group = "LSP" },
            { "<leader>ll", "<cmd>lua vim.lsp.buf.declaration()<cr>",                                              mode = "n", desc = "Declaration" },
            { "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>",                                               mode = "n", desc = "Definition" },
            { "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<cr>",                                           mode = "n", desc = "Implementation" },
            { "<leader>lR", "<cmd>lua vim.lsp.buf.references()<cr>",                                               mode = "n", desc = "References" },
            { "<leader>lK", "<cmd>lua vim.lsp.buf.hover()<cr>",                                                    mode = "n", desc = "Hover" },
            { "<leader>lk", "<cmd>lua vim.lsp.buf.hover()<cr>",                                                    mode = "n", desc = "Hover" },
            {
                "<leader>ln",
                function()
                    return ":IncRename " .. vim.fn.expand("<cword>")
                end,
                expr = true,
                mode = "n",
                desc = "Rename",
            },
            { "<leader>la", "<cmd>lua require('actions-preview').code_actions()<cr>",                        mode = "n", desc = "Code actions" },
            { "<leader>lf", "<cmd>lua require('conform').format({ async = true, lsp_fallback = true })<cr>", mode = "n", desc = "Format" },
            { "<leader>ll", "<cmd>lua vim.diagnostic.open_float()<cr>",                                      mode = "n", desc = "Open float" },
            { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>",                                       mode = "n", desc = "Next Error" },
            { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>",                                       mode = "n", desc = "Prev Error" },
            { "<leader>lh", ":LspRestartBuffer<cr>",                                                         mode = "n", desc = "Restart LSP Server" },
            { "<leader>ly", ":LspStart<cr>",                                                                 mode = "n", desc = "Start LSP Server" },
            { "<leader>F",  group = "Flutter" },
            { "<leader>FF", ":FlutterReload<cr>",                                                            mode = "n", desc = "Reload" },
            { "<leader>Fs", ":FlutterRun<cr>",                                                               mode = "n", desc = "Start/Run" },
            { "<leader>Fr", ":FlutterRestart<cr>",                                                           mode = "n", desc = "Restart" },
            { "<leader>Fd", ":FlutterDevices<cr>",                                                           mode = "n", desc = "Devicesk" },
            { "<leader>Fb", ":FlutterDebug<cr>",                                                             mode = "n", desc = "Debug" },
            { "<leader>Fq", ":FlutterQuit<cr>",                                                              mode = "n", desc = "Quit" },
            { "<leader>Fl", ":FlutterLspRestart<cr>",                                                        mode = "n", desc = "Restart LSP Server" },
            { "<leader>Fn", ":FlutterRename<cr>",                                                            mode = "n", desc = "Rename" },

            { "<leader>ge", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>",                                    mode = "n", desc = "Insert if err nil statement" },
            { "<leader>go", "oif !ok {<CR>}<Esc>Oreturn<Esc>",                                               mode = "n", desc = "Insert if !ok statement" },
            { "<leader>c",  group = "Cloak" },
            { "<leader>cc", "<cmd>:CloakToggle<cr>",                                                         mode = "n", desc = "Toggle" },
            { "<leader>u",  group = "Trouble" },
            { "<leader>ur", "<cmd>TroubleToggle lsp_references<cr>",                                         mode = "n", desc = "References" },
            { "<leader>uf", "<cmd>TroubleToggle lsp_definitions<cr>",                                        mode = "n", desc = "Definitions" },
            { "<leader>ud", "<cmd>TroubleToggle document_diagnostics<cr>",                                   mode = "n", desc = "Diagnostics" },
            { "<leader>uq", "<cmd>TroubleToggle quickfix<cr>",                                               mode = "n", desc = "QuickFix" },
            { "<leader>ul", "<cmd>TroubleToggle loclist<cr>",                                                mode = "n", desc = "LocationList" },
            { "<leader>uw", "<cmd>TroubleToggle workspace_diagnostics<cr>",                                  mode = "n", desc = "Workspace Diagnostics" },
        }
    },
}
