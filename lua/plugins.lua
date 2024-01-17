local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Compile & sync each time this file is edited & source it !
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)

  -- CORE
  use 'wbthomason/packer.nvim' -- Plugin manager
  -- use 'lewis6991/impatient.nvim' -- Speed up neovim
  use{ -- Configuring lsp servers
    'neovim/nvim-lspconfig',
    config = function() require'plugins.nvim-lspconfig' end
  }
  use{ -- Install and manage LSP servers, DAP servers, linters, and formatters
    'williamboman/mason.nvim',
    config = function() require'mason'.setup() end
  }
  use{ -- Bridges mason.nvim with the lspconfig plugin
    'williamboman/mason-lspconfig.nvim',
    config = function() require'plugins.mason-lspconfig' end
  }
  use{ -- Light-weight lsp plugin based on neovim's built-in lsp
    'glepnir/lspsaga.nvim',
    branch = 'main',
    config = function() require'plugins.lspsaga-nvim' end
  }
  use "nvim-lua/plenary.nvim"

  -- SYNTAX
  use { -- Provide a way to use the interface for tree-sitter in Neovim
        -- and to provide some basic functionality such as highlighting based on it
    'nvim-treesitter/nvim-treesitter',
    config = function() require'plugins.treesitter' end
  }
  use 'fladson/vim-kitty' -- Syntax highlight for kitty configuration
  use { -- Indentation guides
    'lukas-reineke/indent-blankline.nvim',
    config = function() require('ibl').setup({
      exclude = {
        filetypes = {
          'dashboard'
        }
      }
    }) end
  }
  use { -- Highlight overlength lines
    'lcheylus/overlength.nvim',
    config = function() require'plugins.overlength' end
  }
  use { -- Linters
    'mfussenegger/nvim-lint',
    requires = {'eslint/eslint', 'squizlabs/PHP_CodeSniffer'},
    config = function() require'plugins.nvim-lint' end
  }
  use 'tpope/vim-rails'
  use {
    'RRethy/nvim-treesitter-endwise',
    config = function() require'nvim-treesitter.configs'.setup {
      endwise = {
        enable = true,
      }
    }
    end
  }

  -- EDITING
  use { -- Surround selections
    'kylechui/nvim-surround',
    tag = '*', -- Use for stability; omit to use `main` branch for the latest features
    config = function() require'nvim-surround'.setup({}) end
  }
  use 'chaoren/vim-wordmotion' -- Smart motion inside words
  use { -- Easy comment
    'terrortylor/nvim-comment',
    config = function() require'nvim_comment'.setup() end
  }
  use{ -- Auto complete pairs symbols
    'windwp/nvim-autopairs',
    config = function() require'plugins.nvim-autopairs' end
  }
  use{ -- Autoclose and autorename html tag
    'windwp/nvim-ts-autotag',
    config = function() require'plugins.nvim-ts-autotag' end
  }
  use{ -- Snippet engine
    'L3MON4D3/LuaSnip',
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load({paths = '~/.config/nvim/my_snippets'})
    end
  }
  use 'inkarkat/vim-ReplaceWithRegister' -- Replace with register contents using motion (gr + motion)
  use 'jose-elias-alvarez/typescript.nvim' -- Additional functionality for typescript server (e.g. rename file & update imports)
  use 'nelstrom/vim-visual-star-search' -- Search based selection
  use 'junegunn/vim-easy-align'
  use({
    'NFrid/markdown-togglecheck',
    requires = 'NFrid/treesitter-utils',
    config = function()
      -- -- toggle checked / create checkbox if it doesn't exist
      -- vim.api.nvim_set_keymap('n', '<leader>nn', require('markdown-togglecheck').toggle)
      -- -- toggle checkbox (it doesn't remember toggle state and always creates [ ])
      -- vim.api.nvim_set_keymap('n', '<leader>nN', require('markdown-togglecheck').toggle_box)
    end
  })

  -- COMPLETION
  use{ -- Completion engine
    'hrsh7th/nvim-cmp',
    requires = {
      "onsails/lspkind-nvim",     -- Icons on the popups
      "hrsh7th/cmp-nvim-lsp",     -- LSP source for nvim-cmp
      "saadparwaiz1/cmp_luasnip", -- Snippets source
      "L3MON4D3/LuaSnip"
    },
    config = function() require'plugins.nvim-cmp' end
  }
  use 'saadparwaiz1/cmp_luasnip' -- Snippet autocompletion
  use 'hrsh7th/cmp-nvim-lsp' -- For autocompletion
  use 'hrsh7th/cmp-buffer' -- Source for text in buffer
  use 'hrsh7th/cmp-path' -- Source for file system paths

  -- -- GIT
  use 'tpope/vim-fugitive' -- Git commands
  use { -- Git symbols in gutter & jump and handle hunks
    'lewis6991/gitsigns.nvim',
    config = function() require'plugins.gitsigns' end
  }

  -- NAVIGATION
  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = "v3.x",
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim'
    }
  }
  use {
    'Bekaboo/dropbar.nvim',
    -- disable = true
    opt = true -- optional
  }
  use { -- Fuzzy finder
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    requires = {'nvim-lua/plenary.nvim'},
    config = function() require'plugins.telescope' end
  }
  use { -- Smarter fuzzy finder
    'danielfalk/smart-open.nvim',
    branch = '0.2.x',
    config = function()
      require'telescope'.load_extension('smart_open')
    end,
    requires = {
      {'kkharji/sqlite.lua'}
    }
  }
  use 'christoomey/vim-tmux-navigator' -- Tmux & split window navigation
  use {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function() require'plugins.dashboard' end,
    requires = {'nvim-tree/nvim-web-devicons'}
  }

  -- UI
  use { -- Themes
    'navarasu/onedark.nvim',
    config = function() require'plugins.onedark' end
  }
  use { -- Status line
    'feline-nvim/feline.nvim',
    branch = '0.5-compat',
    config = function() require'plugins.feline' end
  }
  use 'sangdol/mintabline.vim' -- Add symbol in tab
  use 'kyazdani42/nvim-web-devicons' -- Icons
  use 'onsails/lspkind.nvim' -- vs-code like icons for autocompletion
  use { -- Distraction free visualisation
    'junegunn/goyo.vim',
    config = function() require'plugins.goyo' end
  }
  use 'junegunn/limelight.vim' -- Focus line
  use {
    'levouh/tint.nvim',
    config = function() require'tint'.setup() end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
