# nvim

## Notes
Neovim must be above 0.5

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
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
> You must run this or `PackerSync` whenever you make changes to your plugin configuration
> Regenerate compiled loader file
> `:PackerCompile`

## What i want from my previous config
### Maybe without plugin
- [ ] max line length
- [ ] indent setting by language
- [ ] nice & robust setting for tags
- [ ] set ruler
- [ ] spell check, FR & EN
- [ ] compile when needed

### With plugin
- [ ] surround
- [ ] markdown ? not easy for code blocks
- [ ] a nice completion please
- [ ] comment quickly
- [ ] syntax for:
    - [ ] sql
    - [ ] php
    - [ ] javascript
    - [ ] react
    - [ ] typescript
    - [ ] lua
- [ ] snippets
- [ ] like ctrlp
- [ ] visual search
- [ ] like vim gutter
- [ ] jump chunk to chunk
- [ ] linter

### Done
- [X] map f5 to `:e!`
- [X] like nerdtree
