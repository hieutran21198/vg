require "predefine.gs"
require "predefine.options"
require "predefine.autocmds"
require "predefine.telescope"
require "predefine.nvimtree"
require "predefine.keymappings"
require "predefine.completion"
require "predefine.comment"
require "predefine.terminal"
require "predefine.autopairs"
require "predefine.lualine"

require "predefine.formatters"
require "predefine.linters"

MAIN.plugin_manager.store {
    ["altercation/vim-colors-solarized"] = {},
    ["morhetz/gruvbox"] = {}
}

MAIN.colorscheme = "gruvbox"
MAIN.options.manage {background = "dark", transparent = false}
