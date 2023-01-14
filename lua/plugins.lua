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
  use 'wbthomason/packer.nvim'

  use 'lewis6991/impatient.nvim'

  use 'tpope/vim-fugitive' -- Git commands

  use 'kyazdani42/nvim-web-devicons' -- Icons

  use { -- Themes
    'navarasu/onedark.nvim',
    config = function() require'plugins.onedark' end
  }

  use { -- status line
    'feline-nvim/feline.nvim',
    branch = '0.5-compat',
    config = function() require'plugins.feline' end
  }

  use 'nelstrom/vim-visual-star-search'

  use 'junegunn/goyo.vim'

  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require'plugins.treesitter' end
  }

  use 'fladson/vim-kitty'

  use { -- need neovim > 0.8
    'kyazdani42/nvim-tree.lua',
    opt = true,
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    cmd = {'NvimTreeToggle', 'NvimTreeFindFile'},
    config = function() require'plugins.tree' end
  }

  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = {'nvim-lua/plenary.nvim'},
    config = function() require'plugins.telescope' end
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function() require'plugins.indent-blankline' end
  }

  use {
    'kylechui/nvim-surround',
    tag = '*', -- Use for stability; omit to use `main` branch for the latest features
    config = function() require'nvim-surround'.setup({}) end
  }

  use 'chaoren/vim-wordmotion' -- Smart motion inside words

  use {
    'terrortylor/nvim-comment',
    config = function() require'nvim_comment'.setup() end
  }

  use{
    'windwp/nvim-autopairs',
    config = function() require'plugins.nvim-autopairs' end
  }

  use{
    'windwp/nvim-ts-autotag',
    config = function() require'plugins.nvim-ts-autotag' end
  }

  use{ -- autocompletion
    'hrsh7th/nvim-cmp',
    config = function() require'plugins.nvim-cmp' end
  }

  use("hrsh7th/cmp-buffer") -- source for text in buffer

  use("hrsh7th/cmp-path") -- source for file system paths

  use{ -- snippet engine
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({paths = "~/.config/nvim/my_snippets"})
    end
  }

  use("saadparwaiz1/cmp_luasnip") -- snippet autocompletion

  -- managing & installing lsp servers, linters & formatters
  use{
    "williamboman/mason.nvim",
    config = function() require'mason'.setup() end
  } -- in charge of managing lsp servers, linters & formatters

  use{
    "williamboman/mason-lspconfig.nvim",
    config = function() require'plugins.mason-lspconfig' end
  } -- bridges gap b/w mason & lspconfig

    -- configuring lsp servers
  use{
    "neovim/nvim-lspconfig",
    config = function() require'plugins.nvim-lspconfig' end
  } -- easily configure language servers

  use("hrsh7th/cmp-nvim-lsp") -- for autocompletion

  use{
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function() require'plugins.lspsaga-nvim' end
  } -- enhanced lsp uis

  use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)

  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

  use 'tjdevries/overlength.vim'

  use {
    'mfussenegger/nvim-lint',
    requires = {'eslint/eslint', 'squizlabs/PHP_CodeSniffer'},
    config = function() require'plugins.nvim-lint' end
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function() require'plugins.gitsigns' end
  }

  use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

  use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

  use("sangdol/mintabline.vim")

  if packer_bootstrap then
    require("packer").sync()
  end
end)
