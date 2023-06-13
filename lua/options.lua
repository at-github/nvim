local opt = vim.opt

-- basic settings
opt.encoding = 'utf-8'
opt.completeopt = 'menuone,noselect'
opt.mouse = 'a'

-- Display
opt.synmaxcol = 300 -- stop syntax highlight after x lines for performance
-- There are six methods to select folds:
-- 	manual		manually define folds
-- 	indent		more indent means a higher fold level
-- 	expr		specify an expression to define folds
-- 	syntax		folds defined by syntax highlighting
-- 	diff		folds for unchanged text
-- 	marker		folds defined by markers in the text
opt.foldmethod = 'manual' -- use language syntax to generate folds
opt.showbreak = '↪' -- character to show when line is broken
opt.signcolumn = 'yes'
opt.termguicolors = true
vim.cmd([[
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]])
opt.spelllang = 'en,fr'
opt.spell = true

-- Sidebar
opt.number = true
opt.numberwidth = 3 -- always reserve 3 spaces for line number
-- Search
opt.ignorecase = true -- ignore letter case when searching
opt.smartcase = true -- case insentive unless capitals used in search

-- Indentation
opt.smartindent = true
opt.tabstop = 2 -- 1 tab = 2 spaces
opt.shiftwidth = 2 -- indentation rule
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true

vim.cmd([[
  augroup tab_for_4_spaces
    autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType php setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType make setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType yaml setlocal ts=4 sts=4 sw=4 expandtab
  augroup end

  augroup un_explicit_files
    autocmd BufRead,BufNewFile *.js.erb setfiletype javascript
    autocmd BufRead,BufNewFile *.css.erb setfiletype css
  augroup end
]])

-- Backspace
opt.backspace = 'indent,eol,start' -- backspace works on every char in insert mode
opt.iskeyword:append('-')
opt.iskeyword:append('$')

-- cursor
opt.cursorline = true

-- Clipboard
opt.clipboard:append('unnamedplus')

-- Split
opt.splitright = true
opt.splitbelow = true
