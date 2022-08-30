local map = vim.api.nvim_set_keymap

noremap = {noremap = true}

-- Telescope
-- non breaking space in prompt
map('n', '<leader>ff', ":Telescope find_files prompt_prefix= 🔍  find_command=rg,--ignore,--hidden,--files <cr>", noremap)
map('n', '<leader>fg', ":Telescope git_files  prompt_prefix=  <cr>", noremap)
map('n', '<leader>ft', ":Telescope help_tags  prompt_prefix=  <cr>",  noremap)

--[[ tab, barbar
  no more vim-tab used, only buffer, have to quit explitly for the last buffer
]]
map('n', '<leader>w', ":BufferDelete<cr>", noremap)
map('n', '<leader>q', ":quit<cr>", noremap)
