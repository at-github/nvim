-- Compile each time this file is edited & source it !
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'tpope/vim-fugitive' -- Git commands
    use 'EdenEast/nightfox.nvim' -- Themes
    use {
      'navarasu/onedark.nvim', -- Themes
      config = function() require'plugins.onedark' end
    }
    use {
      'romgrk/barbar.nvim',
      requires = {'kyazdani42/nvim-web-devicons'},
      config = function() require'plugins.barbar' end
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
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = {'nvim-lua/plenary.nvim'}
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
    use 'tjdevries/overlength.vim'
    use {
      'mfussenegger/nvim-lint',
      requires = {'eslint/eslint', 'squizlabs/PHP_CodeSniffer'},
      config = function()
        local lint = require "lint"

        lint.linters.eslint.cmd = "/usr/local/bin/eslint"
        lint.linters.phpcs.cmd = "/home/tarik/.config/composer/vendor/bin/phpcs"

        local phpcs = require('lint.linters.phpcs')
        phpcs.args = {
          '-q',
          '--standard=/home/tarik/dev/test_nvim/standard.xml',
          '--severity=5',
          '--report=json',
          '-'
        }
        lint.linters_by_ft = {
          javascript = {"eslint"},
          php = {'phpcs'}
        }
        -- require('lint').linters_by_ft = {
        --   markdown = {'vale'},
        --   javascript = {'eslint'},
        --   php = {'phpcs'}
        -- }

        -- js no output
        vim.cmd([[au BufEnter *.js lua require('lint').try_lint() ]])
        vim.cmd([[au BufWritePost *.js lua require('lint').try_lint() ]])

        -- php error
        -- Error detected while processing BufEnter Autocommands for "*.php":
        -- Error running phpcs: ENOENT: no such file or directory
        -- works but need to be configured
        vim.cmd([[au BufEnter *.php lua require('lint').try_lint() ]])
        vim.cmd([[au BufWritePost *.php lua require('lint').try_lint() ]])

        -- no output for js, error for markdown, error for php
        -- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        --   callback = function()
        --     require("lint").try_lint()
        --   end,
        -- })
      end
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
  end
)
