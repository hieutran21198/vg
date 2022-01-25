local linters = {}
return function(lts)
    if lts ~= nil then for k, v in pairs(lts) do linters[k] = v end end
    return linters
end
