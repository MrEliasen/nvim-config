local M = {
    opts = {},
}

M.setup = function(opts)
    M.opts = vim.tbl_deep_extend('force', M.opts, opts or {})
end

local output = function(res, silent)
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    local row, col = cursor_pos[1] - 1, cursor_pos[2]

    if vim.v.shell_error == 0 then
        if silent == true then
            return res
        end

        vim.api.nvim_buf_set_text(0, row, col, row, col, vim.split(res, "\n"))
    else
        vim.api.nvim_err_write("Command error: " .. res .. "\n")
    end

    return ""
end

M.command = function(scrollCmd, scrollArgs, silent)
    local cmd = table.concat({ "cd ~/Projects/ooga-booga/scrolls/scrolls-cli && go run ./cmd/scrolls-cli", scrollCmd, scrollArgs}, " ")
    local res = vim.fn.system(cmd)
    return output(res, silent)
end

-- Read
vim.api.nvim_create_user_command("ScrollsRead", function(opts)
    M.command("read", opts.args)
end, { desc = "Reads a Scroll, writing the scroll content to the current cursor position.", nargs = "+" })

-- Cast
vim.api.nvim_create_user_command("ScrollsCast", function(opts)
    M.command("cast", opts.args)
end, { desc = "Casts a Scroll, writing the result to the current cursor position.", nargs = "+" })

-- Write (buffer)
vim.api.nvim_create_user_command("ScrollsWriteFromBuffer", function(opts)
    local name, type = vim.split(opts.args, " ")
    local current_file = vim.api.nvim_buf_get_name(0)

    local args = table.concat({ name, "-f", current_file, "--type", type, "--noui" }, " ")
    M.command("write", args)
end, { desc = "Creates a new scroll from the current buffer/file.", nargs = 1 })

-- Write (selection)
vim.api.nvim_create_user_command("ScrollsWriteFromSelection", function(opts)
    local name, type = vim.split(opts.args, " ")
    -- I probably dont need to do this...
    --[[ local argslist = vim.split(opts.args, " ")
    local type = table.remove(argslist)
    local name = "\"" .. table.concat(opts.args, " ") .. "\"" ]]

    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")
    local lines = vim.api.nvim_buf_get_lines(0, start_pos[2] - 1, end_pos[2], false)

    local selection = table.concat(lines, "\n")
    local args = table.concat({ name, "--type", type, "--source", selection, "--noui" }, " ")

    M.command("write", args)
end, { desc = "Creates a new scroll from the current buffer/file.", nargs = "?" })

-- edit in nvim
--[[ vim.api.nvim_create_user_command("ScrollsEdit", function(opts)
    local name = opts.args

    local path = string.gsub(M.command("config", "get library", true), "\n$", "")

    if path == "" then
        return
    end

    vim.cmd("edit" ..  path .. package.config:sub(1,1) .. name)
end, { desc = "Creates a new scroll from the current buffer/file.", nargs = 1 }) ]]

return M
