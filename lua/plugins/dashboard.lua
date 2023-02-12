require('dashboard').setup {
  theme = 'hyper',
  config = {
    week_header = {
      enable = true
    },
    shortcut = {
      {
        icon = '',
        desc = ' Neovim',
        action = 'vim.cmd("cd ~/.config/nvim | edit README.md | NvimTreeToggle")',
        key = 'n'
      },
      {
        icon = '',
        desc = ' Zsh',
        action = 'vim.cmd("cd ~/.config/zsh | edit README.md | NvimTreeToggle")',
        key = 'z'
      },
      {
        icon = '',
        desc = ' Tmux',
        action = 'vim.cmd("cd ~/.config/tmux | edit README.md | NvimTreeToggle")',
        key = 't'
      },
      {
        icon = '龎',
        desc = ' Docs',
        action = 'vim.cmd("cd ~/.local/docs | edit README.md | NvimTreeToggle")',
        key = 'd'
      },
    },
    packages = {
      enable = false
    },
    project = {
      limit = 3,
      icon = '',
      label = '',
      action = 'Telescope find_files cwd='
    },
    footer = {
      '',
      '"La porte du changement ne peut s’ouvrir que de l’intérieur."',
      'Jacques Salomé'
    }
  }
}
