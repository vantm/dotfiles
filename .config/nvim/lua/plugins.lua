return require 'packer'.startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        requires = {
            { 'nvim-lua/plenary.nvim', opt = false },
            { 'BurntSushi/ripgrep',    opt = false }
        }
    }

    use 'nvim-lualine/lualine.nvim'

    use {
        'phaazon/hop.nvim',
        branch = 'v2',
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
        }
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
            { 'Hoffs/omnisharp-extended-lsp.nvim' },
            { 'SirVer/ultisnips' },
            { 'quangnguyen30192/cmp-nvim-ultisnips' }
        }
    }

    use 'mbbill/undotree'

    use 'nvim-treesitter/nvim-treesitter'

    use 'lukas-reineke/indent-blankline.nvim'

    use 'windwp/nvim-autopairs'

    use 'ellisonleao/gruvbox.nvim'

    use 'nvim-tree/nvim-tree.lua'

    use 'RRethy/vim-illuminate'

    use 'scalameta/nvim-metals'

    use 'ThePrimeagen/harpoon'
end)
