local map = vim.api.nvim_set_keymap

noremap = {noremap = true}

-- Telescope
map('n', '<leader>ff', ":Telescope find_files<cr>", noremap)
map('n', '<leader>fw', ":Telescope buffers<cr>",    noremap)
map('n', '<leader>ft', ":Telescope live_grep<cr>",  noremap)
map('n', '<leader>ft', ":Telescope help_tags<cr>",  noremap)

--[[ tab, barbar
  no more vim-tab used, only buffer, have to quit explitly for the last buffer
]]
map('n', '<leader>w', ":BufferDelete<cr>", noremap)
map('n', '<leader>q', ":quit<cr>", noremap)
