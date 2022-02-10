require "base.whichkey.config"

MAIN.plugin_manager.store {
    ["folke/which-key.nvim"] = {
        config = MAIN.configs["which-key"]
    }
}
