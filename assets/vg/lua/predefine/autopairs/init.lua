require "predefine.autopairs.config"

MAIN.plugin_manager.store {
    ["windwp/nvim-autopairs"] = {
        config = MAIN.configs["nvim-autopairs"]
    }
}
