local keymap = vim.keymap.set

function opts(desc)
    return { silent = true, desc = desc }
end

--Remap space as leader key
keymap('', '<Space>', '<Nop>')
vim.g.mapleader = ' '

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

-- Better window navigation
keymap('n', '<C-h>', '<C-w>h', opts('Focus the left pane'))
keymap('n', '<C-j>', '<C-w>j', opts('Focus the below pane'))
keymap('n', '<C-k>', '<C-w>k', opts('Focus the above pane'))
keymap('n', '<C-l>', '<C-w>l', opts('Focus the right pane'))

-- Resize with arrows
keymap('n', '<C-Up>', ':resize -5<cr>', opts('Horizontally resize -5'))
keymap('n', '<C-Down>', ':resize +5<cr>', opts('Horizontally resize +5'))
keymap('n', '<C-Left>', ':vertical resize -5<cr>', opts('Verically resize -5'))
keymap('n', '<C-Right>', ':vertical resize +5<cr>', opts('Verically resize +5'))

-- Navigate buffers
keymap('n', '<S-l>', ':bnext<cr>', opts('Focus the next buffer'))
keymap('n', '<S-h>', ':bprevious<cr>', opts('Focus the previous buffer'))

-- Save buffer
keymap('n', '<leader>w', ':w<cr>', opts('Save the current buffer'))

-- Close buffers
keymap('n', '<S-q>', ':bd!<cr>', opts('Ignore change and close the current buffer'))

-- Better paste
keymap('n', '<leader>p', '"+p', opts('Paste the content in the registry \'+\' after the current cursor'))
keymap('v', '<leader>p', '"+p', opts('Paste the content in the registry \'+\' after the current cursor'))
keymap('n', '<leader>P', '"+P', opts('Paste the content in the registry \'+\' before the current cursor'))
keymap('v', '<leader>P', '"+P', opts('Paste the content in the registry \'+\' before the current cursor'))
keymap('n', '<leader>y', '"+y', opts('Yank into the registry \'+\''))
keymap('v', '<leader>y', '"+y', opts('Yank into the registry \'+\''))
keymap('n', '<leader>Y', '"+Y', opts('Yank the current line into the registry \'+\''))
keymap('v', '<leader>Y', '"+Y', opts('Yank the current line into the registry \'+\''))

-- Stay in indent mode
keymap('v', '<', '<gv', opts('Decrease indentation'))
keymap('v', '>', '>gv', opts('Increase indentation'))

-- Better replace
keymap('n', 'S', '"_diwP', opts('Replace word under the cursor'))
keymap('v', 'S', '"_dp', opts(''))

-- Auto center after finding/moving
keymap('n', 'n', 'nzzzv')
keymap('n', 'N', 'Nzzzv')
keymap('n', '<C-d>', '<C-d>zz')
keymap('n', '<C-u>', '<C-u>zz')

-- Better join lines
keymap('n', 'J', 'mzJ`z')
keymap('v', 'J', 'mzJ`z')

-- Move line
keymap("n", "<A-k>", ":m-2<CR>==", opts('Move the current line above'))
keymap("n", "<A-j>", ":m+1<CR>==", opts('Move the current line below'))
keymap("v", "<A-k>", ":m'<-2<CR>gv=gv", opts('Move the selected lines above'))
keymap("v", "<A-j>", ":m'>+1<CR>gv=gv", opts('Move the selected lines below'))
keymap("i", "<A-k>", "<C-o>:m-2<CR><C-o>==", opts('Move the current line above'))
keymap("i", "<A-j>", "<C-o>:m+1<CR><C-o>==", opts('Move the current line below'))

-- Open Nvim-Tree
keymap('n', '<leader>e', ':NvimTreeToggle<cr>', opts('Open the file explorer (Nvim-Tree)'))

-- Telescope
keymap('n', '<leader>f', ':Telescope find_files<cr>', opts('Find files'))
keymap('n', '<leader>g', ':Telescope live_grep<cr>', opts('Live grep'))
keymap('n', '<leader>b', ':Telescope buffers<cr>', opts('Find buffers'))
keymap('n', '<leader>h', ':Telescope help_tags<cr>', opts('Find helps'))

-- Undotree
keymap('n', '<leader>u', ':UndotreeToggle<cr>', opts('Open undotree'))

-- harpoon
keymap('n', '<leader>a', ':lua require"harpoon.mark".add_file()<cr>', opts('Add file to harpoon'))
keymap('n', '<leader>pe', ':lua require"harpoon.ui".toggle_quick_menu()<cr>', opts('Open harpoon menu'))
keymap('n', '<leader>1', ':lua require"harpoon.ui".nav_file(1)<cr>', opts('Focus the 1st file in harpoon'))
keymap('n', '<leader>2', ':lua require"harpoon.ui".nav_file(2)<cr>', opts('Focus the 2st file in harpoon'))
keymap('n', '<leader>3', ':lua require"harpoon.ui".nav_file(3)<cr>', opts('Focus the 3st file in harpoon'))
keymap('n', '<leader>4', ':lua require"harpoon.ui".nav_file(4)<cr>', opts('Focus the 4st file in harpoon'))
keymap('n', '<C-l>', ':lua require"harpoon.ui".nav_next()<cr>', opts('Focus the next file in harpoon'))
keymap('n', '<C-h>', ':lua require"harpoon.ui".nav_prev()<cr>', opts('Focus the previous file in harpoon'))

-- DAP
keymap('n', '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<cr>', opts('Debug: toggle break point'))
keymap('n', '<leader>dc', '<cmd>lua require"dap".continue()<cr>', opts('Debug: continue'))
keymap('n', '<leader>di', '<cmd>lua require"dap".step_into()<cr>', opts('Debug: step into'))
keymap('n', '<leader>do', '<cmd>lua require"dap".step_over()<cr>', opts('Debug: step over'))
keymap('n', '<leader>dO', '<cmd>lua require"dap".step_out()<cr>', opts('Debug: step out'))
keymap('n', '<leader>dr', '<cmd>lua require"dap".repl.toggle()<cr>', opts('Debug: repl toggle'))
keymap('n', '<leader>dl', '<cmd>lua require"dap".run_last()<cr>', opts('Debug: run last'))
keymap('n', '<leader>du', '<cmd>lua require"dapui".toggle()<cr>', opts('Debug: toggle DAP UI'))
keymap('n', '<leader>dt', '<cmd>lua require"dap".terminate()<cr>', opts('Debug: terminate'))

-- Hop
keymap('n', 's', '<cmd>lua require"hop".hint_char2()<cr>', opts('Hop by 2 char'))

-- Packer
keymap('n', '<leader>ps', ':PackerSync<cr>', opts('Packer: sync'))
keymap('n', '<leader>pc', ':PackerCompile<cr>', opts('Packer: compile'))

-- Splitting
keymap('n', '<leader>s', '<c-w><c-s>', opts('Split horizontally'))
keymap('n', '<leader>v', '<c-w><c-v>', opts('Split verically'))

-- Lsp
vim.keymap.set('n', '<space>le', vim.diagnostic.open_float, opts('LSP diagnostic: open float'))
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts('LSP diagnostic: go to prev'))
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts('LSP diagnostic: go to next'))
vim.keymap.set('n', '<space>lq', vim.diagnostic.setloclist, opts('LSP diagnostic: set loc list'))

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        function lspopts(desc)
            return { buffer = ev.buf, silent = true, desc = 'LSP: ' .. desc }
        end

        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, lspopts('go to declaration'))
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, lspopts('go to definition'))
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, lspopts('open hover'))
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, lspopts('go to implementation'))
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, lspopts('signature help'))
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, lspopts('add workspace folder'))
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, lspopts('remove workspace folder'))
        vim.keymap.set('n', '<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, lspopts('list workspace folders'))
        vim.keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition, lspopts('go to type definition'))
        vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, lspopts('rename'))
        vim.keymap.set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, lspopts('code action'))
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, lspopts('show references'))
        vim.keymap.set('n', '<leader>lf', function()
            vim.lsp.buf.format { async = true }
        end, lspopts('code format'))
    end,
})
