# nvim

## Notes
Neovim must be above **0.5** to work well with lua config,
and some plugin need **0.7** version.

## Some resources
- https://teukka.tech/luanvim.html
- https://github.com/nanotee/nvim-lua-guide
- https://medium.com/linux-with-michael/a-list-of-all-my-main-neovim-plugins-8ac4ae107e16
- https://vonheikemen.github.io/devlog/tools/build-your-first-lua-config-for-neovim/

## Satisfying (trying) checkhealth
To check run `:checkhealth` in neovim
- Check latest version of `pynvim` is installed (via pip)
- Check npm neovim is installed, but still no enough

## Plugins
### Plugin manager: Packer
### For the first use
[source](https://github.com/wbthomason/packer.nvim#quickstart)

### List

<details>
 <summary>`PackerStatus` :</summary>

- LuaSnip
  - Some useful inspiration for snippets: https://github.com/rafamadriz/friendly-snippets
- PHP_CodeSniffer
- cmp-buffer
- cmp-nvim-lsp
- cmp-path
- cmp_luasnip
- eslint
- feline.nvim
- gitsigns.nvim
- goyo.vim
- indent-blankline.nvim
- lspkind.nvim
- lspsaga.nvim
- mason-lspconfig.nvim
- mason.nvim
- mintabline.vim
- nightfox.nvim
- nvim-autopairs
- nvim-cmp
- nvim-comment
- nvim-lint
- nvim-lspconfig
- nvim-surround
- nvim-tree.lua (not loaded)
- nvim-treesitter
  - git_rebase
  - gitattributes
  - gitcommit
  - css
  - dockerfile
  - html
  - javascript
  - jsdoc
  - json
  - json5
  - lua
  - make
  - markdown
  - ninja
  - php
  - python
  - regex
  - ruby
  - scss
  - sql
  - tsx
  - typescript
  - yaml
- nvim-ts-autotag
- nvim-web-devicons
- onedark.nvim
- overlength.vim
- packer.nvim
- plenary.nvim
- telescope.nvim
- typescript.nvim
- vim-ReplaceWithRegister
- vim-fugitive
- vim-tmux-navigator
- vim-visual-star-search
</details>

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
    - `composer global require "squizlabs/php_codesniffer=*"`  [source](https://github.com/squizlabs/PHP_CodeSniffer#composer)

<details>
 <summary>What i want</summary>

### Maybe without plug-in
- [ ] find lua version of a vim option
- [ ] nice & robust setting for tags
- [ ] smart indentation on paste from clipboard
  - https://github.com/neovim/neovim/issues/3566
  - `]p`
- [ ] bad auto indentation

### With plugin
- [X] a nice completion please
  - [ ] Order suggestion:
    1. definition (with tags?)
    2. buffer
    3. clipboard never
  - [ ] Documentation on hover
- [ ] snippets
  - https://github.com/SirVer/ultisnips
  - *just a library of snippets* https://github.com/honza/vim-snippets
- [X] linter (nvim-lint)
  - [ ] custom icons for error and warning
  - for:
    - [ ] php
      - `phpcs -e *.php` Explain a standard by showing the sniffs it includes
      - `phpcs -s *.php` Show sniff codes in all reports
      - `phpcs -i` Show a list of installed coding standards
      - [ ] force type hint
        - try https://github.com/slevomat/coding-standard
      - [ ] force type return
      - [ ] force strict
    - [ ] lua
    - [ ] nginx
    - [ ] docker
    - [ ] sql
    - [ ] ruby
    - [ ] python
    - [ ] shell
    - [X] javascript
    - [X] react
    - [X] typescript
  - [ ] barbar
    - [ ] uninstall it, find one work well with tab
  - [ ] nvim-lint
    - [ ] disable auto folding
  - [ ] nice buffer when i commit with fugitive and test from git hook is launched

### Done
- [X] spell check, FR & EN
- [X] on fresh open file, jump line of the history
- [X] mouse to click & scroll
- [X] max line length highlight
- [X] keep column width for gitsigns
- [X] barbar
  - [X] use tab instead classic buffer
  - [X] visual order cycling
  Using only buffer & no vim tab make it OK,
  but have to quit explicitly the last buffer
- [X] switch dark / light theme
- [X] succeed to put plug-in config in a separate file
- [X] pair
- [X] visual search
- [X] Visual status bar
- [X] markdown ? Not easy for code blocks
  - Finally no plug-in for markdown, the visual out of the box suit to me.
  Just add goyo, having a clear space when I'm not coding
- [X] ~~like ctrlp~~ telescope
- [X] indent setting by language
- [X] jump chunk to chunk
- [X] like vim gutter
- [X] comment quickly
- [X] surround
- [X] compile when needed
- [X] like nerdtree
- [X] map f5 to `:e!`
</details>
