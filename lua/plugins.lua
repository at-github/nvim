vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'tpope/vim-fugitive' -- Git commands
    use "EdenEast/nightfox.nvim" -- Themes

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
  end
)
