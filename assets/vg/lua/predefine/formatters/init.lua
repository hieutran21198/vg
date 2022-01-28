local jsfamiliar_formatter = {
    function()
        return {
            exe = "prettier",
            args = {
                "--stdin-filepath",
                vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
            },
            stdin = true
        }
    end
}

MAIN.formatters {
    javascript = jsfamiliar_formatter,
    typescript = jsfamiliar_formatter,
    typescriptreact = jsfamiliar_formatter,
    javascriptreact = jsfamiliar_formatter,
    lua = {
        function()
            return {exe = "luafmt", args = {"--stdin"}, stdin = true}
        end
    },
    json = {
        function()
            return {
                exe = "prettier",
                args = {
                    "--format",
                    "json",
                    "--stdin-filepath",
                    vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
                },
                stdin = true
            }
        end
    },
    yaml = {
        function()
            return {
                exe = "prettier",
                args = {
                    "--format",
                    "yaml",
                    "--stdin-filepath",
                    vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
                },
                stdin = true
            }
        end
    },
    sh = {
        function()
            return {
                exe = "shfmt",
                args = {
                    "-l",
                    "-w",
                    vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
                },
                stdin = false
            }
        end
    }
}

MAIN.format_on_save {
    "*.js",
    "*.jsx",
    "*.ts",
    "*.tsx",
    "*.json",
    "*.yaml",
    "*.lua",
    "*.sh",
    "*.yml"
}
