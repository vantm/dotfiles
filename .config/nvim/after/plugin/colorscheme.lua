vim.o.background = "dark"

require 'rose-pine'.setup {
    disable_italics = true,
    disable_background = true,
}

vim.cmd([[colorscheme rose-pine]])

-- Fix colors for Telescope
vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = '#000000', fg = '#a2a2a2' })
vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = '#000000' })
vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = '#2a2a2a', bold = true, fg = '#ffffff' })
vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', { bg = '#2a2a2a', bold = true })
vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { bg = '#000000' })

-- Fix color for Nvim-Tree
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#000000' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#000000' })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#2a2a2a' })
