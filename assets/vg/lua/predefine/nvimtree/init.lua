require "predefine.nvimtree.config"

MAIN.plugin_manager.store {
    ["kyazdani42/nvim-tree.lua"] = {
        requires = {"kyazdani42/nvim-web-devicons"},
        config = MAIN.configs["nvim-tree"]
    }
}
