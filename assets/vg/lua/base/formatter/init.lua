MAIN.plugin_manager.store {
    ["mhartington/formatter.nvim"] = {
        config = function()
            local ok, formatter = pcall(require, "formatter")
            if not ok then
                return
            end
            local fts = MAIN.formatters()
            MAIN.autocmds.set {
                _FormatterAG = {{"BufWritePost", table.concat(MAIN.format_on_save(), ","), "FormatWrite"}}
            }
            formatter.setup {
                filetype = fts
            }
        end
    }
}
