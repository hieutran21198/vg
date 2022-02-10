require "base.lspinstaller.config"

MAIN.plugin_manager.store {
    ["williamboman/nvim-lsp-installer"] = {
        config = MAIN.configs["nvim-lsp-installer"]
    }
}
