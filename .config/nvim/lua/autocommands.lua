vim.cmd [[highlight NormalFloat ctermbg=DarkBlue ctermfg=DarkGray]]
vim.cmd [[highlight Pmenu ctermbg=DarkBlue ctermbg=LightGray]]

local my_augroup = vim.api.nvim_create_augroup("MyAutoGroup", {
    clear = false
})

vim.api.nvim_create_autocmd({ "InsertEnter" }, {
    pattern = { "*.*" },
    group = my_augroup,
    callback = function()
        vim.opt.relativenumber = false
    end
})

vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave" }, {
    pattern = { "*" },
    group = my_augroup,
    callback = function()
        vim.opt.relativenumber = true
    end
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    group = my_augroup,
    command = [[%s/\s\+$//ge]]
})
