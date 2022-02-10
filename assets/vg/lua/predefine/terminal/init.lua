require "predefine.terminal.config"

MAIN.plugin_manager.store {
    ["numtostr/FTerm.nvim"] = {
        config = MAIN.configs["FTerm"]
    }
}
