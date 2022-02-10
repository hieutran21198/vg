require "base.lspconfig.config"

MAIN.plugin_manager.store {
    ["neovim/nvim-lspconfig"] = {
        config = MAIN.configs["lspconfig"]
    }
}
