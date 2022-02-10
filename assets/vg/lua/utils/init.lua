return {
    file_exists = function(name)
        local f = io.open(name, "r")
        if f ~= nil then
            io.close(f)
            return true
        end
        return false
    end,
    scandir = function(directory)
        local i, t, popen = 0, {}, io.popen
        local pfile = popen('ls -a "' .. directory .. '"')
        for filename in pfile:lines() do
            i = i + 1
            t[i] = filename
        end
        pfile:close()
        return t
    end,
    load_file = function(filepath)
        local lf, error = pcall(vim.cmd, "luafile " .. filepath)
        if not lf then
            print(error)
        end
    end,
    is_included = function(arr, k)
        for _, v in ipairs(arr) do
            if v == k then
                return true
            end
        end
        return false
    end,
    require_dep = function(depname, fn)
        if type(fn) ~= "function" then
            return
        end
        local ok, dep = pcall(require, depname)
        if not ok then
            return
        end
        fn(dep)
    end
}
