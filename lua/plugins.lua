local packer = require("packer")
local use = packer.use

return packer.startup(
  function()
    use 'wbthomason/packer.nvim'

    use 'tpope/vim-fugitive' -- Git commands
    use "EdenEast/nightfox.nvim" -- Themes

    -- WIP
    use {
      'kyazdani42/nvim-tree.lua',
      opt = true,
      requires = {
        'kyazdani42/nvim-web-devicons',
      },
      cmd = {"NvimTreeToggle", "NvimTreeFindFile"},
      config = function()
        require("nvim-tree").setup {
          filters = {
            dotfiles = false,
            custom = {'.git'}
          },
          open_on_tab = true,
          hijack_cursor = true
        }
      end
    }
  end
)
