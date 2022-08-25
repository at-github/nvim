# nvim

## Notes
Neovim must be above 0.5 to work well with lua config

## Some resources
- https://teukka.tech/luanvim.html
- https://github.com/nanotee/nvim-lua-guide

## Satisfying (trying) checkhealth
To check run `:checkhealth` in neovim
- Check latest version of `pynvim` is installed (via pip)
- Check npm neovim is installed, but still no enough

## Plugin manager: Packer
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

## External dependancies
- `ripgrep`
- `fd-find`
- `python3`
- `pip`
- `pynvim`
- `npm`
- `npm neovim`

<details>
 <summary>What i want</summary>

### Maybe without plugin
- [ ] spell check, FR & EN
- [ ] max line length highlight
- [ ] nice & robust setting for tags
- [ ] smart indentation on paste from clipboard
- [ ] keep column width for gitsigns
  - when line was deleted, or after add to stage
- [ ] On open jump line of the history

### With plugin
- [ ] succed to put plugin config in a separate file
- [ ] a nice completion please
  - No easy response, i want nice completion mainly for javascript & php.
  Php often not really supported by vim & neovim community
  - candidates:
    - coc
    - nvim-comp
  - Order suggestion:
    1. definition
    2. buffer
    3. clipboard never
- [ ] snippets
- [ ] linter
  - candidates:
    - ALE
    - nvim-lint
    - nvim-lspconfig
  - for:
    - [ ] sql
    - [ ] php
    - [ ] javascript
    - [ ] react
    - [ ] typescript
    - [ ] ruby
    - [ ] python
    - [ ] lua
    - [ ] shell
    - [ ] nginx
    - [ ] docker

### Done
- [X] pair
- [X] visual search
- [X] Visual status bar
- [X] markdown ? not easy for code blocks
  - Finally no plugin for markdown, the visual out of the box suit to me.
  Just add goyo, having a clear space when i'm not coding
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
