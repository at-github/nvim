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
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
> You must run this or `PackerSync` whenever you make changes to your plugin configuration
> Regenerate compiled loader file
> `:PackerCompile`

## What i want from my previous config
### Maybe without plugin
- [ ] indent setting by language
- [ ] spell check, FR & EN
- [ ] set ruler
- [ ] max line length
- [ ] nice & robust setting for tags

### With plugin
- [ ] surround
- [ ] comment quickly
- [ ] like ctrlp
- [ ] jump chunk to chunk
- [ ] like vim gutter
- [ ] markdown ? not easy for code blocks
- [ ] a nice completion please
- [ ] syntax for:
    - [ ] sql
    - [ ] php
    - [ ] javascript
    - [ ] react
    - [ ] typescript
    - [ ] lua
- [ ] snippets
- [ ] visual search
- [ ] linter
- [ ] succed to put plugin config in a separate file

### Done
- [X] compile when needed
- [X] like nerdtree
- [X] map f5 to `:e!`
