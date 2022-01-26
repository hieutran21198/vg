require "utils.table"
local store = {}

local M = {}

M.store = function(plugins)
    if plugins ~= nil then
        for k, v in pairs(plugins) do
            table.insert(v, k)
            store[k] = v
        end
        return
    end
    return store
end

M.disable = function(plugins)
    if plugins ~= nil then
        for _, v in ipairs(plugins) do
            store = table.remove_key(store, v)
        end
    end
end

M.setup = function(app_runtime_dir)
    local gpacker = "https://github.com/wbthomason/packer.nvim"
    if vim.fn.empty(vim.fn.glob(app_runtime_dir .. "/site/pack/packer/start/packer.nvim")) > 0 then
        local cmd = "!git clone " .. gpacker .. " " .. app_runtime_dir .. "/site/pack/packer/start/packer.nvim"
        vim.api.nvim_command(cmd)
        vim.api.nvim_command("packadd packer.nvim")
    end
    local ok, packer = pcall(require, "packer")
    if not ok then
        return
    end
    local packer_utils = require "packer.util"
    packer.init {
        package_root = app_runtime_dir .. "/site/pack",
        compile_path = app_runtime_dir .. "/plugin/packer_compiled.lua",
        display = {
            open_fn = function()
                return packer_utils.float {border = "rounded"}
            end
        }
    }
end

M.compile = function()
    local ok, packer = pcall(require, "packer")
    if not ok then
        return
    end
    packer.startup(
        function(use)
            use "wbthomason/packer.nvim"
            for _, plug in pairs(store) do
                use(plug)
            end
        end
    )
end

return M
