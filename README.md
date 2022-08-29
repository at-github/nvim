# nvim

## Notes
Neovim must be above **0.5** to work well with lua config,
and some plugin need **0.7** version.

## Some resources
- https://teukka.tech/luanvim.html
- https://github.com/nanotee/nvim-lua-guide
- https://medium.com/linux-with-michael/a-list-of-all-my-main-neovim-plugins-8ac4ae107e16

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

<details>
 <summary>What i want</summary>

### Maybe without plug-in
- [ ] mouse to click & scroll
- [ ] find lua version of a vim option
- [ ] spell check, FR & EN
- [ ] nice & robust setting for tags
- [ ] on fresh open file, jump line of the history
- [ ] smart indentation on paste from clipboard
  - https://github.com/neovim/neovim/issues/3566
  - `]p`

### With plugin
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
- [X] linter (nvim-lint)
  - for:
    - [ ] sql
    - [/] php
    - [/] javascript
    - [ ] react
    - [ ] typescript
    - [ ] ruby
    - [ ] python
    - [ ] lua
    - [ ] shell
    - [ ] nginx
    - [ ] docker

### Done
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
