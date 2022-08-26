require('nvim-treesitter.configs').setup {
  -- A list of parser names, or 'all'
  ensure_installed = {
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
