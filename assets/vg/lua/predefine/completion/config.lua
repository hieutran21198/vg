MAIN.configs["cmp"] = {
    setup = {
        snippet = {
            expand = function(args)
                require"snippy".expand_snippet(args.body)
            end
        },
        sources = {
            {name = "nvim_lsp"}, {name = "snippy"}, {name = "path"},
            {name = "cmp_tabnine"}, {name = "buffer"}
        },
        formatting = {
            format = function(entry, item)
                local symbol = MAIN.configs["cmp"].symbols
                item.kind = symbol[item.kind]
                item.menu = ({
                    buffer = "[Buffer]",
                    nvim_lsp = "[LSP]",
                    snippy = "[Snippet]",
                    neorg = "[Neorg]",
                    cmp_tabnine = "[TN]"
                })[entry.source.name]
                return item
            end
        }
    },
    custom_setup = {
        function(params)
            local cmp = require "cmp"
            params.mapping = {
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping({
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close()
                }),
                ["<CR>"] = cmp.mapping.confirm({select = true}),
                ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(),
                                        {"i", "s"}),
                ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(),
                                          {"i", "s"})
            }
            return params
        end
    },
    symbols = {
        Text = "   (Text) ",
        Method = "   (Method)",
        Function = "   (Function)",
        Constructor = "   (Constructor)",
        Field = " ﴲ  (Field)",
        Variable = "[] (Variable)",
        Class = "   (Class)",
        Interface = " ﰮ  (Interface)",
        Module = "   (Module)",
        Property = " 襁 (Property)",
        Unit = "   (Unit)",
        Value = "   (Value)",
        Enum = " 練 (Enum)",
        Keyword = "   (Keyword)",
        Snippet = "   (Snippet)",
        Color = "   (Color)",
        File = "   (File)",
        Reference = "   (Reference)",
        Folder = "   (Folder)",
        EnumMember = "   (EnumMember)",
        Constant = " ﲀ  (Constant)",
        Struct = " ﳤ  (Struct)",
        Event = "   (Event)",
        Operator = "   (Operator)",
        TypeParameter = "   (TypeParameter)"
    }
}

MAIN.configs["snippy"] = {
    setup = {
        mappings = {
            is = {["<C-j>"] = "expand_or_advance", ["<C-k>"] = "previous"}
        },
        snippets_dirs = {MAIN.paths.app_config_dir .. "/snippets"},
        hl_group = "Search"
    }
}
