require'mason'.setup()
local mason_lspconfig = require'mason-lspconfig'
mason_lspconfig.setup({
  ensure_installed = {
    'cssls',
    'dockerls',
    'eslint',
    'html',
    'intelephense',
    'jsonls',
    'lua_ls',
    'marksman',
    'pylsp',
    'ruby_ls',
    'solargraph',
    'sqlls',
    'tailwindcss',
    'tsserver',
    'volar',
    'yamlls'
  },
  pip = {
    upgrade_pip = true
  }
})
