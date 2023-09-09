local M = {}

local bufs = {}

local function pop()
    if #bufs > 0 then
        return table.remove(bufs)
    else
        return nil
    end
end

local function push(nr)
    for i = #bufs, 1, -1 do
        v = bufs[i]
        if v == nr then
            table.remove(bufs, i)
        end
    end

    table.insert(bufs, nr)
end

local function buf_listed(nr)
    local info = vim.fn.getbufinfo(nr)

    if #info > 0 and info[1].listed == 1 then
        return true
    end

    return false
end

local augroup = vim.api.nvim_create_augroup("augroup_lastbuf", {
    clear = true
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*" },
    group = augroup,
    callback = function(e)
        if buf_listed(e.buf) then
            push(e.buf)
        end
    end
})

M.open_last_buf = function()
    pop()
    local buf = pop()

    if buf ~= nil then
        vim.api.nvim_set_current_buf(buf)
    end
end

M.inspect = function()
    vim.print(vim.inspect(bufs))
end

return M
