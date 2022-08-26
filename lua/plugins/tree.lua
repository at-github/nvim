require('nvim-tree').setup {
  filters = {
    dotfiles = false,
    custom = {'.git'}
  },
  open_on_tab = true,
  hijack_cursor = true
}
