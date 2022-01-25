local generic_opts_any = {noremap = true, silent = true}
local generic_opts = {
    insert_mode = generic_opts_any,
    normal_mode = generic_opts_any,
    visual_mode = generic_opts_any,
    visual_block_mode = generic_opts_any,
    command_mode = generic_opts_any,
    term_mode = {silent = true},
    select_mode = generic_opts_any
}
local mode_adapters = {
    insert_mode = "i",
    normal_mode = "n",
    term_mode = "t",
    visual_mode = "v",
    visual_block_mode = "x",
    command_mode = "c",
    select_mode = "s"
}
local store_native = {}
local store = {}
local service = {}

service.manage = function(maps, native)
    if native ~= nil then
        for k, v in pairs(maps) do store_native[k] = v end
    else
        for _, v in ipairs(maps) do table.insert(store, v) end
    end
end

service.set = function(keymappings, native)
    if keymappings == nil then return end
    if native ~= nil then
        for mode, mappings in pairs(keymappings) do
            local vim_mode = mode_adapters[mode] and mode_adapters[mode] or mode
            for k, v in pairs(mappings) do
                local val = v
                local opts =
                    generic_opts[vim_mode] and generic_opts[vim_mode] or
                        generic_opts_any
                if type(v) == "table" then
                    opts = v[2]
                    val = v[1]
                end
                vim.api.nvim_set_keymap(vim_mode, k, val, opts)
            end
        end
    else
        local ok, whichkey = pcall(require, "which-key")
        if not ok then
            print "which key is not installed"
            return
        end
        for _, mappings in ipairs(keymappings) do
            whichkey.register(mappings.group, mappings.opts)
        end
    end
end

service.compile = function()
    service.set(store)
    service.set(store_native, true)
end

return service
