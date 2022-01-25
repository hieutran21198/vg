local store = {}
local M = {}

M.manage = function(g)
    if g ~= nil then
        for k, v in pairs(g) do store[k] = v end
    else
        return store
    end
end

M.set = function(g) for k, v in pairs(g) do vim.g[k] = v end end

M.compile = function() M.set(store) end

return M
