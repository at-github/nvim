require('nvim-treesitter.configs').setup {
  -- enable syntax highlighting
  highlight = {
    enable = true,
  },
  -- enable indentation
  indent = {enable = true},
  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = {enable = true},
  -- ensure these language parsers are installed
  ensure_installed = {
    'git_rebase',
    'gitattributes',
    'gitcommit',
    'css',
    'dockerfile',
    'html',
    'javascript',
    'jsdoc',
    'json',
    'json5',
    'lua',
    'make',
    'markdown',
    'ninja',
    'php',
    'python',
    'regex',
    'ruby',
    'scss',
    'sql',
    'tsx',
    'typescript',
    'yaml'
  },
  -- Automatically install missing parsers when entering buffer
  auto_install = true,
}
