MAIN.configs["lspconfig"] = {
    custom_options = {
        function(opts, name)
            if name == "sumneko_lua" then
                local custom_opt = {
                    settings = {Lua = {workspace = {preloadFileSize = 500}}}
                }
                return vim.tbl_deep_extend("force", opts, custom_opt)
            end
            return opts
        end
    },
    set_custom_options = function(opt_fns)
        for _, opt_fn in ipairs(opt_fns) do
            table.insert(MAIN.configs["lspconfig"].custom_options, opt_fn)
        end
    end,
    set_on_attach = function(opts, on_attach)
        local def_on_attach = opts.on_attach
        opts.on_attach = function(client, bufnr)
            if def_on_attach ~= nil and type(def_on_attach) == "function" then
                def_on_attach(client, bufnr)
            end
            if on_attach ~= nil and type(on_attach) == "function" then
                on_attach(client, bufnr)
            end
        end
    end
}
