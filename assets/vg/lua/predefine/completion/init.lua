require "predefine.completion.config"
MAIN.plugin_manager.store {
    ["hrsh7th/nvim-cmp"] = {
        requires = {
            "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path",
            "dcampos/cmp-snippy", "dcampos/nvim-snippy"
        },
        config = function()
            local ok, cmp = pcall(require, "cmp")
            if not ok then return end
            local conf = MAIN.configs["cmp"]
            local setup = conf.setup
            for _, custom_setup_fn in ipairs(conf.custom_setup) do
                setup = custom_setup_fn(setup)
            end
            table.insert(MAIN.configs["lspconfig"].custom_options,
                         function(opts)
                local cmp_lsp = require "cmp_nvim_lsp"
                local capabilities = cmp_lsp.update_capabilities(vim.lsp
                                                                     .protocol
                                                                     .make_client_capabilities())
                opts.capabilities = capabilities
                return opts
            end)
            cmp.setup(setup)
        end
    },
    ["dcampos/cmp-snippy"] = {
        config = function()
            local ok, snippy = pcall(require, "snippy")
            if not ok then return end
            local snippet_conf = MAIN.configs["snippy"]
            snippy.setup(snippet_conf.setup)
        end
    }
}
