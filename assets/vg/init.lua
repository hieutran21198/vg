local appname = vim.env.APPNAME
if appname == "" then
    print "Appname is empty please define your application name"
    return
end

local app_runtime_dir = vim.env.HOME .. "/.local/share/" .. appname
-- set runtime path wrapper neovim.
local rtp = vim.opt.rtp._info.default
for p in string.gmatch(rtp, "([^,]+)") do
    if string.find(p, vim.env.HOME .. "/.config") or
        string.find(p, vim.env.HOME .. "/.local/share") then
        local vp = p:gsub("nvim", appname)
        vim.opt.rtp:remove(p)
        vim.opt.rtp:append(vp)
    end
end
vim.opt.rtp:append(app_runtime_dir)
vim.cmd [[let &packpath = &runtimepath]]

require "main"
MAIN.bootstrap {
    paths = {
        app_runtime_dir = app_runtime_dir,
        appname = appname,
        app_config_dir = vim.env.HOME .. "/.config/" .. appname
    }
}
