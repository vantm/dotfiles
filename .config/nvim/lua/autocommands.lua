vim.cmd [[highlight NormalFloat ctermbg=DarkBlue ctermfg=DarkGray]]
vim.cmd [[highlight Pmenu ctermbg=DarkBlue ctermbg=LightGray]]

local augroup = vim.api.nvim_create_augroup("augroup_mine", {
    clear = false
})

vim.api.nvim_create_autocmd({ "InsertEnter" }, {
    pattern = { "*.*" },
    group = augroup,
    callback = function()
        vim.opt.relativenumber = false
    end
})

vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave" }, {
    pattern = { "*" },
    group = augroup,
    callback = function()
        vim.opt.relativenumber = true
    end
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    group = augroup,
    command = [[%s/\s\+$//ge]]
})
