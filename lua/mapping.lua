local map = vim.api.nvim_set_keymap

noremap = {noremap = true}

-- Telescope
map('n', '<leader>ff', ":Telescope find_files prompt_prefix= 🔍  find_command=rg,--ignore,--hidden,--files <cr>", noremap)
map('n', '<leader>fg', ":Telescope git_files  prompt_prefix=  <cr>", noremap)
map('n', '<leader>ft', ":Telescope help_tags  prompt_prefix=  <cr>",  noremap)

--[[ tab, barbar
  no more vim-tab used, only buffer, have to quit explitly for the last buffer
]]
map('n', '<leader>w', ":BufferDelete<cr>", noremap)
map('n', '<leader>q', ":quit<cr>", noremap)

-- COC
-- Confirm selection with ctr space
vim.cmd([[
  inoremap <silent><expr> <c-space> coc#pum#visible() ? coc#pum#confirm() : "\<tab>"
]])

-- Cycle suggestion with tab ↓ and s-tab ↑
vim.cmd([[
  inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1) :
    \ CheckBackspace() ? "\<Tab>" :
    \ coc#refresh()
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
]])

--[[ FIXME documentation on hover
-- > Error on notification "doHover": hover provider not found for current buffer, your language server doesn't support it
-- So install server php
]]
vim.cmd([[
  nnoremap <silent> <leader>h :call CocActionAsync('doHover')<cr>
]])
