require "predefine.completion.config"

MAIN.plugin_manager.store {
    ["hrsh7th/nvim-cmp"] = {
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "dcampos/cmp-snippy",
            "dcampos/nvim-snippy"
        },
        config = MAIN.configs["cmp"]
    },
    ["dcampos/cmp-snippy"] = {
        config = MAIN.configs["snippy"]
    }
}
