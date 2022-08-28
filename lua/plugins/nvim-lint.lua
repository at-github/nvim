local lint = require 'lint'

-- JS
lint.linters.eslint.cmd = '/usr/lib/node_modules/eslint/bin/eslint.js'
local eslint = require('lint.linters.eslint')
eslint.args = {
  '-c=/home/tarik/.config/nvim/eslint.json',
}

-- PHP
lint.linters.phpcs.cmd = '/home/tarik/.config/composer/vendor/bin/phpcs'
local phpcs = require('lint.linters.phpcs')
phpcs.args = {
  '-q',
  '--standard=/home/tarik/.config/nvim/standard.xml',
  '--report=json',
  '-'
}

-- LUA
lint.linters.luacheck.cmd = '/usr/local/bin/luacheck'
local luacheck = require('lint.linters.luacheck')
luacheck.args = {}

-- All
lint.linters_by_ft = {
  javascript = {'eslint'},
  php = {'phpcs'},
  lua = {'luacheck'}
}

vim.cmd('autocmd BufEnter,BufWritePost,InsertLeave * lua require("lint").try_lint()')
