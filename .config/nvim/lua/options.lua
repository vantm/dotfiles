vim.opt.backup = false         -- creates a backup file
vim.opt.cmdheight = 1          -- more space in the neovim command line for displaying messages
vim.opt.conceallevel = 0       -- so that `` is visible in markdown files
vim.opt.fileencoding = 'utf-8' -- the encoding written to a file
vim.opt.hlsearch = true        -- highlight all matches on previous search pattern
vim.opt.ignorecase = true      -- ignore case in search patterns
vim.opt.mouse = 'a'            -- allow the mouse to be used in neovim
vim.opt.pumheight = 10         -- pop up menu height
vim.opt.showtabline = 0        -- always show tabs
vim.opt.showmode = false       -- we don't need to see things like -- INSERT -- anymore
vim.opt.smartcase = true       -- smart case
vim.opt.smartindent = true     -- make indenting smarter again
vim.opt.splitbelow = true      -- force all horizontal splits to go below current window
vim.opt.splitright = true      -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false       -- creates a swapfile
vim.opt.timeout = true
vim.opt.timeoutlen = 300       -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true        -- enable persistent undo
vim.opt.updatetime = 500       -- faster completion (4000ms default)
vim.opt.writebackup = false    -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = true       -- convert tabs to spaces
vim.opt.shiftwidth = 4         -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4            -- insert 2 spaces for a tab
vim.opt.cursorline = true      -- highlight the current line
vim.opt.number = true          -- set numbered lines
vim.opt.laststatus = 3         -- only the last window will always have a status line
vim.opt.showcmd = false        -- hide (partial) command in the last line of the screen (for performance)
vim.opt.ruler = false          -- hide the line and column number of the cursor position
vim.opt.numberwidth = 4        -- minimal number of columns to use for the line number {default 4}
vim.opt.signcolumn = 'yes'     -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false           -- display lines as one long line
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.listchars = { space = '·', tab = '>-' }
vim.opt.termguicolors = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

if vim.g.neovide then
    vim.o.guifont = 'CaskaydiaCove NF:h12'
    vim.g.neovide_scroll_animation_length = 0.5
    vim.g.neovide_cursor_animation_length = 0.1
    vim.g.neovide_cursor_trail_size = 0.2
    vim.g.neovide_cursor_vfx_mode = "pixiedust"
end
