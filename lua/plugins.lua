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

local status, packer = pcall(require, "packer")
if not status then
  return
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'tpope/vim-fugitive' -- Git commands

  use 'EdenEast/nightfox.nvim' -- Themes

  use 'kyazdani42/nvim-web-devicons'

  use {
    'navarasu/onedark.nvim', -- Themes
    config = function() require'plugins.onedark' end
  }

  use 'nelstrom/vim-visual-star-search'

  use {
    'feline-nvim/feline.nvim',
    branch = '0.5-compat',
    config = function() require'plugins.feline' end
  }

  use 'junegunn/goyo.vim'

  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require'plugins.treesitter' end
  }

  use {
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
    config = function() require'nvim-surround'.setup() end
  }

  use {
    'terrortylor/nvim-comment',
    config = function() require'nvim_comment'.setup() end
  }

  use {
    'windwp/nvim-autopairs',
    config = function() require'nvim-autopairs'.setup() end
  }

  use {
    --[[
      You have to install coc extension or configure language servers for LSP support.
      Install extensions like:
      :CocInstall coc-json coc-tsserver
    ]]
    'neoclide/coc.nvim',
    branch = 'release',
    config = function() require'plugins.coc' end
  }

  use 'tjdevries/overlength.vim'

  use {
    'mfussenegger/nvim-lint',
    requires = {'eslint/eslint', 'squizlabs/PHP_CodeSniffer'},
    config = function() require'plugins.nvim-lint' end
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Couldn’t move those in mappin.lua
          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, {expr=true})

          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, {expr=true})

          -- Actions
          map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
          map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
          map('n', '<leader>hu', gs.undo_stage_hunk)
          map('n', '<leader>hp', gs.preview_hunk)
          map('n', '<leader>hb', function() gs.blame_line{full=true} end)
          map('n', '<leader>tb', gs.toggle_current_line_blame)
          map('n', '<leader>hd', gs.diffthis)
        end
      }
    end
  }

  use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

  use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

  if packer_bootstrap then
    require("packer").sync()
  end
end)
