table.remove_key = function(tbl, key)
    local new_tbl = {}
    for k, v in pairs(tbl) do if k ~= key then new_tbl[k] = v end end
    return new_tbl
end
