return require 'packer'.startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        requires = {
            { 'nvim-lua/plenary.nvim', opt = false },
            { 'BurntSushi/ripgrep', opt = false }
        },
        config = function()
            local actions = require 'telescope.actions'
            require 'telescope'.setup {
                defaults = {
                    mappings = {
                        i = {
                            ['<Down>'] = actions.move_selection_next,
                            ['<Up>'] = actions.move_selection_previous,
                            ['<C-j>'] = actions.move_selection_next,
                            ['<C-k>'] = actions.move_selection_previous
                        }
                    }
                },
                pickers = {
                    find_files = {
                        find_command = {
                            'rg',
                            '--files',
                            '-g', '!**/.git/*',
                            '-g', '!**/node_modules/*',
                            '-g', '!**/.vs/*',
                            '-g', '!**/.idea/*',
                            '-g', '!**/dist/*',
                            '-g', '!**/bin/*',
                            '-g', '!**/obj/*',
                            '-g', '!**/*.lock',
                            '-g', '!**/*.lock.json',
                            '-g', '!**/*.{dll,bin,min.js,min.css}'
                        }
                    },
                },
            }
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        config = function()
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
        end
    }

    use {
        'phaazon/hop.nvim',
        branch = 'v2',
        config = function()
            require 'hop'.setup()
        end
    }

    use {
        'williamboman/mason.nvim',
        tag = 'stable',
        run = ':MasonUpdate',
        requires = {
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'mfussenegger/nvim-dap' },
            { 'jose-elias-alvarez/null-ls.nvim' },
            { 'hrsh7th/cmp-nvim-lsp' },
        },
        config = function()
            require 'mason'.setup {
            }

            require 'mason-lspconfig'.setup {
                ensure_installed = {
                    'bashls',
                    'csharp_ls',
                    'cssls',
                    'gopls',
                    'html',
                    'jsonls',
                    'lua_ls',
                    'pyright',
                    'rust_analyzer',
                    'tsserver',
                },
                automatic_installation = true
            }

            require 'null-ls'.setup {
            }
        end
    }

    use {
        'hrsh7th/nvim-cmp',
        requires = {
            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-cmdline' },
            { 'hrsh7th/nvim-cmp' },
            { 'Decodetalkers/csharpls-extended-lsp.nvim' },
        },
        config = function()
            local cmp = require 'cmp'

            local check_backspace = function()
                local col = vim.fn.col '.' - 1
                return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
            end

            cmp.setup {
                snippet = {},
                mapping = cmp.mapping.preset.insert {
                    ['<C-k>'] = cmp.mapping.select_prev_item(),
                    ['<C-j>'] = cmp.mapping.select_next_item(),
                    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
                    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
                    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
                    ['<C-e>'] = cmp.mapping {
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close(),
                    },
                    -- Accept currently selected item. If none selected, `select` first item.
                    -- Set `select` to `false` to only confirm explicitly selected items.
                    ['<CR>'] = cmp.mapping.confirm { select = true },
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif check_backspace() then
                            fallback()
                        else
                            fallback()
                        end
                    end, {
                        'i',
                        's',
                    }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end, {
                        'i',
                        's',
                    }),
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'nvim_lua' },
                    { name = 'buffer' },
                    { name = 'path' },
                },
                confirm_opts = {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false,
                },
            }

            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                })
            })


            local lspconfig = require 'lspconfig'
            local capabilities = require 'cmp_nvim_lsp'.default_capabilities()

            lspconfig.lua_ls.setup {
                capabilities = capabilities
            }
            lspconfig.pyright.setup {
                capabilities = capabilities
            }
            lspconfig.tsserver.setup {
                capabilities = capabilities
            }
            lspconfig.rust_analyzer.setup {
                capabilities = capabilities
            }
            lspconfig.gopls.setup {
                capabilities = capabilities
            }
            lspconfig.csharp_ls.setup {
                handlers = {
                    ['textDocument/definition'] = require 'csharpls_extended'.handler,
                },
                cmd = { 'csharp-ls' }
            }
        end
    }

    use { 'mbbill/undotree' }

    use {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = {
                    'c',
                    'lua',
                    'vim',
                    'vimdoc',
                    'go',
                    'rust',
                    'typescript',
                    'javascript',
                    'html',
                    'css',
                    'scss',
                    'c_sharp',
                    'sql',
                    'markdown',
                    'json',
                    'yaml'
                },
                highlight = {
                    enable = true
                }
            }
        end
    }

    use {
        'akinsho/bufferline.nvim',
        tag = 'v4.2.0',
        requires = 'nvim-tree/nvim-web-devicons',
        config = function()
            local bufferline = require 'bufferline'
            bufferline.setup {
                options = {
                    style_preset = {
                        bufferline.style_preset.no_italic,
                        bufferline.style_preset.no_bold
                    },
                    indicator = {
                        icon = '',
                        style = 'underline',
                    },
                    buffer_close_icon = ''
                }
            }
        end
    }

    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require 'indent_blankline'.setup {}
        end
    }

    use {
        'windwp/nvim-autopairs',
        config = function()
            require 'nvim-autopairs'.setup {}
        end
    }

    use {
        'ellisonleao/gruvbox.nvim',
        config = function()
            vim.o.background = "dark"

            require 'gruvbox'.setup {
                italic = {
                    strings = false,
                    comments = false,
                    operators = false,
                    folds = false
                },
                transparent_mode = true,
            }

            vim.cmd([[colorscheme gruvbox]])
        end
    }

    use {
        'nvim-tree/nvim-tree.lua',
        config = function()
            require("nvim-tree").setup {
                view = {
                    number = true,
                    relativenumber = true
                }
            }
        end
    }

    use 'RRethy/vim-illuminate'

end)
