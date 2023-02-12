local mason_lspconfig = require'mason-lspconfig'
mason_lspconfig.setup({
  ensure_installed = {
    'cssls',
    'dockerls',
    'eslint',
    'html',
    'intelephense',
    'jsonls',
    'marksman',
    'phpactor',
    'ruby_ls',
    'solargraph',
    'sqlls',
    'lua_ls',
    'tailwindcss',
    'tsserver',
    'yamlls'
  }
})
