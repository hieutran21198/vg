local store = {}

local M = {
    debuggers = function(debuggers)
        if debuggers ~= nil then
            for k, v in pairs(debuggers) do
                store[k] = v
            end
        end
        return store
    end
}

return M
