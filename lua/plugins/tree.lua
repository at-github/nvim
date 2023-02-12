require('nvim-tree').setup {
  filters = {
    dotfiles = false,
    custom = {'.git'}
  },
  open_on_tab = true, -- Keep tree on new tab
  hijack_cursor = true, -- Keeps the cursor on the first letter of the filename when moving in the tree.
  live_filter = {
    prefix = "[] ",
    always_show_folders = false
  }
}
