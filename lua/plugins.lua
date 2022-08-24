local packer = require("packer")
local use = packer.use

return packer.startup(
    function()
        print 'startup'
        use 'wbthomason/packer.nvim'

        use 'tpope/vim-fugitive' -- Git commands
        use "EdenEast/nightfox.nvim" -- Themes
        
        use {
          'kyazdani42/nvim-tree.lua',
                requires = {
                'kyazdani42/nvim-web-devicons', -- optional, for file icons
            },
          config = [[require('nvimtree')]]
        }
    end
)
