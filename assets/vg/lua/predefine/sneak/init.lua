require "predefine.sneak.config"
MAIN.plugin_manager.store {
    ["justinmk/vim-sneak"] = {
        config = function()
            local conf = MAIN.configs["vim-sneak"]
            conf.setup()
        end
    }
}
