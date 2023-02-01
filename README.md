# nvim

![screenshot](./screenshot.png)

## Notes
Neovim must be above **0.5** to work well with lua config,
and some plugin need **0.7** version.

## Commands

### General

- `<leader>+` increase first number in line after the cursor
- `<leader>-` decrease first number in line after the cursor
- `<leader>o` close other splits
- `<leader>w` close buffer
- `<leader>q` quit all
- `<F5>` Refresh buffer
- `<leader>e` refresh buffer
- `<C-↑→↓←>` to move into panes

### Visual

- `<leader>t` to switch dark|light theme
- `<leader>g` toggle goyo view mode

### GitSigns

- `]c` next hunk
- `[c` next hunk
- `<leader>hs` stage hunk
- `<leader>hr` reset hunk
- `<leader>hu` undo hunk
- `<leader>hp` preview hunk
- `<leader>hb` preview hunk in popup
- `<leader>tb` preview hunk in line
- `<leader>hd` diff current file

### Telescope

- `<leader>ff` find file
- `<leader>fg` find file with git
- `<leader>ft` find file with tag

### Saga

- `<C-k>` & `<C-j>` to move

### Completion

Some lsp server work only inside project folder,
needing *git* or *composer*…

- `<CR>` to choose selected suggestion

### Lspsaga

- `gf` show definition
- `gD` got to declaration
- `gd` see definition
- `gi` go to implementation
- `<leader>ca` see available code actions
- `<leader>rn` smart rename
- `<leader>D` show diagnostics
- `[d` go to next dianostic
- `]d` go to previous dianostic
- `K` show documentation
- `<leader>s` show structure

#### Typescript specific

- `<leader>rf` rename file & update imports
- `<leader>oi` organize imports
- `<leader>ru` remove unused variables

#### Easy align
- `<leader>=` interactively align selection

## Some resources

- https://teukka.tech/luanvim.html
- https://github.com/nanotee/nvim-lua-guide
- https://medium.com/linux-with-michael/a-list-of-all-my-main-neovim-plugins-8ac4ae107e16
- https://vonheikemen.github.io/devlog/tools/build-your-first-lua-config-for-neovim/
- https://github.com/josean-dev/dev-environment-files
- https://marioyepes.com/neovim-ide-with-lua-for-web-development/

## Satisfying (trying) checkhealth

To check run `:checkhealth` in neovim
- Check latest version of `pynvim` is installed (via pip)
- Check npm neovim is installed, but still no enough

## Plugins

### Plugin manager: Packer

### For the first use

[source](https://github.com/wbthomason/packer.nvim#quickstart)


> To get started, first clone this repository to somewhere on your packpath, e.g.:
```shell
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
> You must run this or `PackerSync` whenever you make changes to your plugin configuration
> Regenerate compiled loader file
> `:PackerCompile`

## External dependencies

- `ripgrep`
- `fd-find`
- `python3`
- `pip`
- `pynvim`
- `npm`
  - `neovim`
  - `eslint`
- `nerd font`
  - https://www.nerdfonts.com/
- `composer`
  - `phpcs`
