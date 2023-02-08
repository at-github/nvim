local lint = require 'lint'
local linters = lint.linters

-- JS
linters.eslint.cmd = '/usr/local/bin/eslint'
local eslint = require('lint.linters.eslint')
eslint.args = {
  '-c=/home/tarik/.config/nvim/eslint.json',
}

-- PHP
linters.phpcs.cmd = '/home/tarik/.config/composer/vendor/bin/phpcs'
local phpcs = require('lint.linters.phpcs')
phpcs.args = {
  '-q',
  '--standard=/home/tarik/.config/nvim/standard.xml',
  '--extensions=php',
  '--report=json',
  '-'
}

-- All
lint.linters_by_ft = {
  javascript = {'eslint'},
  typescript = {'eslint'},
  typescriptreact = {'eslint'},
  php = {'phpcs'}
}

vim.cmd('autocmd BufEnter,BufWritePost,InsertLeave * lua require("lint").try_lint()')
