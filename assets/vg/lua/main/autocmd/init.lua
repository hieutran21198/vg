local store = {}
local M = {
    manage = function(cmds)
        if cmds ~= nil then
            for k, v in pairs(cmds) do
                store[k] = v
            end
        else
            return store
        end
    end,
    set = function(cmds)
        for group, def in pairs(cmds) do
            vim.cmd("augroup " .. group)
            vim.cmd("autocmd!")
            for _, v in pairs(def) do
                local cmd = table.concat(vim.tbl_flatten {"autocmd", v}, " ")
                vim.cmd(cmd)
            end
            vim.cmd "augroup END"
        end
    end
}

function M.compile()
    M.set(store)
end

return M
