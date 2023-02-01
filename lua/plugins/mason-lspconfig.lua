local mason_lspconfig = require'mason-lspconfig'
mason_lspconfig.setup({
  ensure_installed = {
    'cssls',
    'dockerls',
    'eslint',
    'html',
    'jsonls',
    'marksman',
    'psalm',
    'ruby_ls',
    'sqlls',
    'sumneko_lua',
    'tailwindcss',
    'tsserver',
    'yamlls'
  }
})
