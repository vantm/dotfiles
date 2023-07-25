vim.cmd [[highlight NormalFloat ctermbg=DarkBlue ctermfg=DarkGray]]
vim.cmd [[highlight Pmenu ctermbg=DarkBlue ctermbg=LightGray]]

local my_auto_commands = vim.api.nvim_create_augroup("MyAutoCommands", {
    clear = false
})

vim.api.nvim_create_autocmd({ "InsertEnter" }, {
    pattern = { "*.*" },
    group = my_auto_commands,
    callback = function()
        vim.opt.relativenumber = false
    end
})

vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave" }, {
    pattern = { "*" },
    group = my_auto_commands,
    callback = function()
        vim.opt.relativenumber = true
    end
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
    pattern = { "*" },
    group = my_auto_commands,
    callback = function()
        require 'nvim-tree.api'.tree.open()
    end
})
