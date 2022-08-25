vim.g.mapleader = ','

-- basic settings
vim.o.encoding = 'utf-8'
vim.o.completeopt = 'menuone,noselect'

-- Display
vim.o.backspace = 'indent,eol,start' -- backspace works on every char in insert mode
vim.o.synmaxcol = 300 -- stop syntax highlight after x lines for performance
vim.o.foldmethod = 'syntax' -- use language syntax to generate folds
vim.o.showbreak= '↪' -- character to show when line is broken
vim.cmd('colorscheme nightfox')

-- Sidebar
vim.o.number = true
vim.o.numberwidth = 3 -- always reserve 3 spaces for line number
vim.o.ignorecase = true -- ignore letter case when searching
vim.o.smartcase = true -- case insentive unless capitals used in search

-- tabs
vim.o.smartindent = true
vim.o.tabstop = 2 -- 1 tab = 2 spaces
vim.o.shiftwidth = 2 -- indentation rule
vim.o.expandtab = true -- expand tab to spaces

vim.cmd([[
  augroup tab_for_python
    autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
  augroup end
]])

-- Mapping
vim.api.nvim_set_keymap('n', '<F5>', ':e!<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true })
