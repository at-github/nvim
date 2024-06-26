vim.g.mapleader = ','

local map = vim.api.nvim_set_keymap
local noremap = { noremap = true }

-- general
map('n', '<leader>+', '<C-a>', noremap)
map('n', '<leader>-', '<C-x>', noremap)

map('n', '<leader>o', ':on<cr>', noremap)
map('n', '<leader>w', ':q<cr>', noremap)
map('n', '<leader>q', ':qa<cr>', noremap)

map('n', '<F5>', ':e!<CR>', noremap)
map('n', '<leader>e', ':Neotree toggle<CR>', noremap)
map('n', '<leader>r', ':lua PreviewReadme()<CR>', noremap)

-- Goyo
map('n', '<leader>g', ':Goyo <cr>', noremap)

-- Telescope
map('n', '<leader>f', ':Telescope git_files prompt_prefix=  <cr>', noremap)
map('n', '<leader>ff', ':Telescope find_files hidden=true no_ignore=true prompt_prefix=  <cr>', noremap)
map('n', '<leader>fg', ':Telescope live_grep prompt_prefix= 󰈞 <cr>', noremap)
map('n', '<leader>ft', ':Telescope help_tags prompt_prefix=  <cr>', noremap)
map('n', '<leader>fr', ':Telescope resume prompt_prefix=  <cr>', noremap)

-- Vim-tmux-navigator
map('n', '<C-Left>', ':TmuxNavigateLeft<cr>', noremap)
map('n', '<C-Down>', ':TmuxNavigateDown<cr>', noremap)
map('n', '<C-Up>', ':TmuxNavigateUp<cr>', noremap)
map('n', '<C-Right>', ':TmuxNavigateRight<cr>', noremap)

-- Vim-easy-align
map('v', '<leader>=', ':LiveEasyAlign<cr>', noremap)

-- Mardown togglecheck
-- -- toggle checked / create checkbox if it doesn't exist
map('n', '<space>', ":lua require('markdown-togglecheck').toggle()<cr>", noremap)
-- -- toggle checkbox (it doesn't remember toggle state and always creates [ ])
map('n', '<leader><space>', ":lua require('markdown-togglecheck').toggle_box()<cr>", noremap)
