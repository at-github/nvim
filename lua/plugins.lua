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
      config = function()
        require('onedark').setup{
          -- dark, darker, warm, warmer
          style = 'warm'
        }
        require('onedark').load()
      end
    }
    use {
      'kyazdani42/nvim-tree.lua',
      opt = true,
      requires = {
        'kyazdani42/nvim-web-devicons',
      },
      cmd = {"NvimTreeToggle", "NvimTreeFindFile"},
      config = function()
        require("nvim-tree").setup {
          -- TODO one day try again to put config another place
          filters = {
            dotfiles = false,
            custom = {'.git'}
          },
          open_on_tab = true,
          hijack_cursor = true
        }
      end
    }
    use({
      "kylechui/nvim-surround",
      tag = "*", -- Use for stability; omit to use `main` branch for the latest features
      config = function()
        require("nvim-surround").setup()
      end
    })
    use({
      'terrortylor/nvim-comment',
      config = function()
        require('nvim_comment').setup()
      end
    })
    use({
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
    })
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = {{'nvim-lua/plenary.nvim'}}
    }
  end
)
