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

- `<leader>f` find file with git
- `<leader>fg` find file with grep
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
- `<leader>f` format current buffer

#### Typescript specific

- `<leader>rf` rename file & update imports
- `<leader>oi` organize imports
- `<leader>ru` remove unused variables

#### Ruby On Rails specific

- `:A` alternate between file & test
- `:R` jump to related controller->view
- `:Emodel` jump to related model
- `:Smodel` same but in split
- `:Vmodel` same but in vsplit
- `:Tmodel` same but in tab
- `:Eview` jump to related view
- `:Sview` same but in split
- `:Vview` same but in vsplit
- `:Tview` same but in tab
- `:Econtroller` jump to related controller
- `:Scontroller` same but in split
- `:Vcontroller` same but in vsplit
- `:Tcontroller` same but in tab
- `:Emodel foo!` to automatically create the file with the standard boilerplate if it doesn't exist
- `:Rails console` to call `rails console`
- `:Generate controller ControllerName` generate controller and loads the generated files into the quickfix list
- `:Rails` (with no arguments) to run the current test, spec, or feature
- `:.Rails` to do a focused run of just the method, example, or scenario on the current line
- `:Extract {file}` replaces the desired range (typically selected in visual line mode) with render '{file}'
  - `help rails-:Extract`
- `:help rails-navigation`

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
