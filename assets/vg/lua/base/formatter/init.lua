require "base.formatter.config"

MAIN.plugin_manager.store {
    ["mhartington/formatter.nvim"] = {
        config = MAIN.configs["formatter"]
    }
}
