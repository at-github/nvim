vim.g.mapleader = ','

-- basic settings
vim.o.encoding = 'utf-8'
vim.o.completeopt = 'menuone,noselect'
vim.opt.mouse = 'a'

-- Display
vim.o.backspace = 'indent,eol,start' -- backspace works on every char in insert mode
vim.o.synmaxcol = 300 -- stop syntax highlight after x lines for performance
vim.o.foldmethod = 'syntax' -- use language syntax to generate folds
vim.o.showbreak = '↪' -- character to show when line is broken
vim.o.signcolumn = 'yes'
vim.opt.termguicolors = true
vim.cmd([[
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]])
vim.o.spelllang = 'en,fr'
vim.o.spell = true

-- Sidebar
vim.o.number = true
vim.o.numberwidth = 3 -- always reserve 3 spaces for line number
vim.o.ignorecase = true -- ignore letter case when searching
vim.o.smartcase = true -- case insentive unless capitals used in search

-- Tabs
vim.o.smartindent = true
vim.o.tabstop = 2 -- 1 tab = 2 spaces
vim.o.shiftwidth = 2 -- indentation rule
vim.o.expandtab = true -- expand tab to spaces

vim.cmd([[
  augroup tab_for_python
    autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType php setlocal ts=4 sts=4 sw=4 expandtab
  augroup end
]])

-- Mapping
vim.api.nvim_set_keymap('n', '<F5>', ':e!<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true })

function toggleThemeLight()
  vim.o.background = vim.o.background == 'dark' and 'light' or 'dark'
end

vim.api.nvim_set_keymap('n', '<Leader>t', ':lua toggleThemeLight()<CR>', { noremap = true })
