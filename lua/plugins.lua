return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'tpope/vim-fugitive' -- Git commands
    use "EdenEast/nightfox.nvim" -- Themes
end)
