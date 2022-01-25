local format_on_save = {}
local formatters = {}
return {
    formatters = function(fts)
        if fts ~= nil then
            formatters = vim.tbl_deep_extend("force", formatters, fts)
        end
        return formatters
    end,
    format_on_save = function(fts)
        if fts ~= nil then
            for _, v in ipairs(fts) do
                table.insert(format_on_save, v)
            end
        end
        return format_on_save
    end
}

