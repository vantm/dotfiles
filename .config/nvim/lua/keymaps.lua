local keymap = vim.keymap.set
local opts = { silent = true }

--Remap space as leader key
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

-- Better window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
keymap('n', '<C-Up>', ':resize -5<cr>', opts)
keymap('n', '<C-Down>', ':resize +5<cr>', opts)
keymap('n', '<C-Left>', ':vertical resize -5<cr>', opts)
keymap('n', '<C-Right>', ':vertical resize +5<cr>', opts)

-- Navigate buffers
keymap('n', '<S-l>', ':bnext<cr>', opts)
keymap('n', '<S-h>', ':bprevious<cr>', opts)

-- Clear highlights
keymap('n', '//', '<cmd>nohlsearch<cr>', opts)

-- Save buffer
keymap('n', '<leader>w', ':w<cr>', opts)

-- Close buffers
keymap('n', '<S-q>', ':bd!<cr>', opts)

-- Better paste
keymap('n', '<leader>p', '"+p', opts)
keymap('v', '<leader>p', '"+p', opts)
keymap('n', '<leader>P', '"+P', opts)
keymap('v', '<leader>P', '"+P', opts)
keymap('n', '<leader>y', '"+y', opts)
keymap('v', '<leader>y', '"+y', opts)
keymap('n', '<leader>Y', '"+Y', opts)
keymap('v', '<leader>Y', '"+Y', opts)

-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Better replace
keymap('n', 'S', '"_diwP', opts)
keymap('v', 'S', '"_diwP', opts)

-- Auto center after finding/moving
keymap('n', 'n', 'nzzzv')
keymap('n', 'N', 'Nzzzv')
keymap('n', '<C-d>', '<C-d>zz')
keymap('n', '<C-u>', '<C-u>zz')

-- Better join lines
keymap('n', 'J', 'mzJ`z')
keymap('v', 'J', 'mzJ`z')

-- Move line
keymap("n", "<A-k>", ":m-2<CR>==")
keymap("n", "<A-j>", ":m+1<CR>==")
keymap("v", "<A-k>", ":m'<-2<CR>gv=gv")
keymap("v", "<A-j>", ":m'>+1<CR>gv=gv")
keymap("i", "<A-k>", "<C-o>:m-2<CR><C-o>==")
keymap("i", "<A-j>", "<C-o>:m+1<CR><C-o>==")

-- Open Nvim-Tree
keymap('n', '<leader>e', ':NvimTreeToggle<cr>', opts)

-- Telescope
keymap('n', '<leader>f', ':Telescope find_files<cr>', opts)
keymap('n', '<leader>g', ':Telescope live_grep<cr>', opts)
keymap('n', '<leader>b', ':Telescope buffers<cr>', opts)
keymap('n', '<leader>h', ':Telescope help_tags<cr>', opts)

-- Undotree
keymap('n', '<leader>u', ':UndotreeToggle<cr>', opts)

-- harpoon
keymap('n', '<leader>m', ':lua require"harpoon.mark".add_file()<cr>', opts)
keymap('n', '<leader>he', ':lua require"harpoon.ui".toggle_quick_menu()<cr>', opts)
keymap('n', '<leader>1', ':lua require"harpoon.ui".nav_file(1)<cr>', opts)
keymap('n', '<leader>2', ':lua require"harpoon.ui".nav_file(2)<cr>', opts)
keymap('n', '<leader>3', ':lua require"harpoon.ui".nav_file(3)<cr>', opts)
keymap('n', '<C-l>', ':lua require"harpoon.ui".nav_next()<cr>', opts)
keymap('n', '<C-h>', ':lua require"harpoon.ui".nav_prev()<cr>', opts)

-- DAP
keymap('n', '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<cr>', opts)
keymap('n', '<leader>dc', '<cmd>lua require"dap".continue()<cr>', opts)
keymap('n', '<leader>di', '<cmd>lua require"dap".step_into()<cr>', opts)
keymap('n', '<leader>do', '<cmd>lua require"dap".step_over()<cr>', opts)
keymap('n', '<leader>dO', '<cmd>lua require"dap".step_out()<cr>', opts)
keymap('n', '<leader>dr', '<cmd>lua require"dap".repl.toggle()<cr>', opts)
keymap('n', '<leader>dl', '<cmd>lua require"dap".run_last()<cr>', opts)
keymap('n', '<leader>du', '<cmd>lua require"dapui".toggle()<cr>', opts)
keymap('n', '<leader>dt', '<cmd>lua require"dap".terminate()<cr>', opts)

-- Hop
keymap('n', 's', '<cmd>lua require"hop".hint_char2()<cr>', opts)

-- Packer
keymap('n', '<leader>ss', ':PackerSync<cr>', opts)
keymap('n', '<leader>sc', ':PackerCompile<cr>')

-- Lsp
vim.keymap.set('n', '<space>le', vim.diagnostic.open_float, opts)
--vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
--vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>lq', vim.diagnostic.setloclist, opts)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local inner_opts = { buffer = ev.buf, silent = true }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, inner_opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, inner_opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, inner_opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, inner_opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, inner_opts)
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, inner_opts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, inner_opts)
        vim.keymap.set('n', '<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, inner_opts)
        vim.keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition, inner_opts)
        vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, inner_opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, inner_opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, inner_opts)
        vim.keymap.set('n', '<leader>lf', function()
            vim.lsp.buf.format { async = true }
        end, inner_opts)
    end,
})
