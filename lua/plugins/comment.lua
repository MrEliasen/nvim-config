local comment = require("Comment");
--[[local commentstring_utils = require("ts_context_commentstring.utils")
local commentstring_internal = require("ts_context_commentstring.internal") ]]

comment.setup(
    --[[ {pre_hook = function(ctx)
        local U = comment.utils 

        local location = nil
        if ctx.ctype == U.ctype.block then
            location = commentstring_utils.get_cursor_location()
        elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
            location = commentstring_utils.get_visual_start_location()
        end

        return commentstring_internal.calculate_commentstring({
            key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
            location = location,
        })
    end,} ]]
)
