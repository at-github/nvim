vim.g.mapleader = ','

local map = vim.api.nvim_set_keymap
local noremap = {noremap = true}

-- general
map('n', '<leader>+', '<C-a>', noremap)
map('n', '<leader>-', '<C-x>', noremap)

map('n', '<leader>w', ":q<cr>", noremap)
map('n', '<leader>q', ":qa<cr>", noremap)

map('n', '<F5>', ':e!<CR>', noremap)
map('n', '<leader>e', ':NvimTreeToggle<CR>', noremap)

-- Goyo
map('n', '<leader>g', ":Goyo <cr>", noremap)

-- Telescope
map('n', '<leader>ff', ":Telescope find_files prompt_prefix= 🔍  find_command=rg,--ignore,--hidden,--files <cr>", noremap)
map('n', '<leader>fg', ":Telescope git_files  prompt_prefix=  <cr>", noremap)
map('n', '<leader>ft', ":Telescope help_tags  prompt_prefix=  <cr>",  noremap)
