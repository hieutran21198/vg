MAIN.settings["nvim-autopairs"] = {
    setup = {
        break_line_filetype = {
            "javascript",
            "typescript",
            "typescriptreact",
            "javascriptreact",
            "go"
        },
        disable_filetype = {
            "TelescopePrompt",
            "vim",
            "NvimTree"
        }
    }
}

MAIN.configs["nvim-autopairs"] = function()
    local ok, autopairs = pcall(require, "nvim-autopairs")
    if not ok then
        return
    end
    local settings = MAIN.settings["nvim-autopairs"]
    autopairs.setup(settings.setup)
end
