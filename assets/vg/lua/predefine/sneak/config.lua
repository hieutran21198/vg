MAIN.settings["nvim-sneak"] = {
    setup = function()
        MAIN.g.set {
            ["sneak#label"] = true
        }
    end
}

MAIN.configs["nvim-sneak"] = function()
    local settings = MAIN.settings["nvim-sneak"]
    settings.setup()
end
