require 'lualine'.setup {
    options = {
        globalstatus = true,
        icons_enabled = false,
        theme = 'gruvbox'
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'sdiff' },
        lualine_c = { 'filename' },
        lualine_x = { 'spaces', 'encoding', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    }
}
