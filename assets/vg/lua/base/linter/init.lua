MAIN.plugin_manager.store {
    ["mfussenegger/nvim-lint"] = {
        config = function()
            MAIN.autocmds.set {
                _linting = {
                    {"BufWritePost", "<buffer>", "lua require'lint'.try_lint()"}
                }
            }
            local ok, linters = pcall(require, "lint")
            if not ok then
                return
            end
            linters.linters_by_ft = MAIN.linters()
        end
    }
}
