local utils = require "utils"

utils.require_dep(
    "cmp",
    function(cmp)
        MAIN.settings["cmp"] = {
            setup = {
                snippet = {
                    expand = function(args)
                        require "snippy".expand_snippet(args.body)
                    end
                },
                sources = {
                    {name = "nvim_lsp"},
                    {name = "snippy"},
                    {name = "path"},
                    {name = "buffer"}
                },
                formatting = {
                    format = function(entry, item)
                        local symbol = MAIN.settings["cmp"].symbols
                        item.kind = symbol[item.kind]
                        item.menu =
                            ({
                            buffer = "[Buffer]",
                            nvim_lsp = "[LSP]",
                            snippy = "[Snippet]",
                            neorg = "[Neorg]"
                        })[entry.source.name]
                        return item
                    end
                },
                mapping = {
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping(
                        {
                            i = cmp.mapping.abort(),
                            c = cmp.mapping.close()
                        }
                    ),
                    ["<CR>"] = cmp.mapping.confirm({select = true}),
                    ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "s"}),
                    ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "s"})
                }
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
    end
)

MAIN.configs["cmp"] = function()
    local ok, cmp = pcall(require, "cmp")
    if not ok then
        return
    end
    local settings = MAIN.settings["cmp"]
    if settings == nil then
        return
    end
    table.insert(
        MAIN.settings["lspconfig"].custom_options,
        function(opts)
            if opts == nil then
                opts = {}
            end
            local cmp_lsp_ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
            if not cmp_lsp_ok then
                return opts
            end
            local capabilities = opts.capabilities
            if capabilities == nil then
                capabilities = cmp_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
            end
            opts.capabilities = capabilities
            return opts
        end
    )
    cmp.setup(settings.setup)
end

utils.require_dep(
    "snippy",
    function()
        MAIN.settings["snippy"] = {
            setup = {
                mappings = {
                    is = {["<C-j>"] = "expand_or_advance", ["<C-k>"] = "previous"}
                },
                snippets_dirs = {MAIN.paths.app_config_dir .. "/snippets"},
                hl_group = "Search"
            }
        }
    end
)

MAIN.configs["snippy"] = function()
    local ok, snippy = pcall(require, "snippy")
    if not ok then
        return
    end
    local settings = MAIN.settings["snippy"]
    snippy.setup(settings.setup)
end
