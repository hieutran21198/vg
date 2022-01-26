require "predefine.terminal.config"
MAIN.plugin_manager.store {
    ["numtostr/FTerm.nvim"] = {
        config = function()
            local ok, fterm = pcall(require, "FTerm")
            if not ok then
                return
            end
            local conf = MAIN.configs["fterm"]
            fterm.setup(conf.setup)
            MAIN.keymappings.set(conf.keymappings)
        end
    }
}
