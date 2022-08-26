-- Compile each time this file is edited
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
      config = function()
        local gruvbox = {
          fg = '#928374',
          bg = '#1F2223',
          black ='#1B1B1B',
          skyblue = '#458588',
          cyan = '#83a597',
          green = '#689d6a',
          oceanblue = '#1d2021',
          magenta = '#fb4934',
          orange = '#fabd2f',
          red = '#cc241d',
          violet = '#b16286',
          white = '#ebdbb2',
          yellow = '#d79921',
        }
        local feline = require('feline')
        feline.setup({
          theme = gruvbox
        })
      end
    }

    use 'junegunn/goyo.vim'

    use {
      'nvim-treesitter/nvim-treesitter',
      config = function()
        require('nvim-treesitter.configs').setup {
          -- A list of parser names, or 'all'
          ensure_installed = {
            'css',
            'dockerfile',
            'html',
            'javascript',
            'jsdoc',
            'json',
            'json5',
            'lua',
            'make',
            'markdown',
            'ninja',
            'php',
            'python',
            'regex',
            'ruby',
            'scss',
            'sql',
            'tsx',
            'typescript',
            'yaml'
          },
          -- Automatically install missing parsers when entering buffer
          auto_install = true,
        }
      end
    }

    use {
      'kyazdani42/nvim-tree.lua',
      opt = true,
      requires = {
        'kyazdani42/nvim-web-devicons',
      },
      cmd = {'NvimTreeToggle', 'NvimTreeFindFile'},
      config = function()
        require('nvim-tree').setup {
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

    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = {'nvim-lua/plenary.nvim'}
    }

    use {
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        require("indent_blankline").setup {
          char = '┆',
          show_current_context = true, -- globally enable or not
          show_current_context_start = true, -- signature (or just start object) context
          show_trailing_blankline_indent = false,
          show_first_indent_level= false,
        }
      end
    }

    use {
      'kylechui/nvim-surround',
      tag = '*', -- Use for stability; omit to use `main` branch for the latest features
      config = function()
        require('nvim-surround').setup()
      end
    }

    use {
      'terrortylor/nvim-comment',
      config = function()
        require('nvim_comment').setup()
      end
    }

    use {
      'windwp/nvim-autopairs',
      config = function() require('nvim-autopairs').setup {} end
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
