local options = {}
local M = {}

M.manage = function(opts)
    if opts ~= nil then
        for k, v in pairs(opts) do options[k] = v end
    else
        return options
    end
end

M.compile = function()
    local opt = vim.opt
    local cmd = vim.cmd
    for k, v in pairs(options) do
        if k == "line_wrap_cursor_movement" then
            if v == true then cmd "set whichwrap+=<,>,[,],h,l" end
        elseif k == "transparent" then
            if v == true then
                cmd "au ColorScheme * hi Normal ctermbg=none guibg=none"
                cmd "au ColorScheme * hi SignColumn ctermbg=none guibg=none"
                cmd "au ColorScheme * hi NormalNC ctermbg=none guibg=none"
                cmd "au ColorScheme * hi MsgArea ctermbg=none guibg=none"
                cmd "au ColorScheme * hi TelescopeBorder ctermbg=none guibg=none"
                cmd "au ColorScheme * hi NvimTreeNormal ctermbg=none guibg=none"
                cmd "let &fcs='eob: '"
            end
        else
            opt[k] = v
        end
    end
end

return M
