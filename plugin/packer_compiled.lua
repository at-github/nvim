-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/tarik/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/tarik/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/tarik/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/tarik/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/tarik/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["barbar.nvim"] = {
    config = { "\27LJ\2\2Å\1\0\0\3\0\b\0\r6\0\0\0009\0\1\0009\0\2\0\a\0\3\0X\0\aÄ6\0\4\0'\1\5\0B\0\2\0029\0\6\0)\1\31\0'\2\a\0B\0\3\1K\0\1\0\rFileTree\15set_offset\21bufferline.state\frequire\rNvimTree\rfiletype\abo\bvimò\1\0\0\3\0\t\0\0186\0\0\0009\0\1\0009\0\2\0'\1\3\0B\0\2\2\18\1\0\0009\0\4\0'\2\5\0B\0\3\2\15\0\0\0X\1\6Ä6\0\6\0'\1\a\0B\0\2\0029\0\b\0)\1\0\0B\0\2\1K\0\1\0\15set_offset\21bufferline.state\frequire\rNvimTree\nmatch\f<afile>\vexpand\afn\bvim‚\1\1\0\4\0\14\0\0236\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\1\a\0005\2\b\0003\3\t\0=\3\n\2B\0\3\0016\0\4\0009\0\5\0009\0\6\0'\1\v\0005\2\f\0003\3\r\0=\3\n\2B\0\3\1K\0\1\0\0\1\0\1\fpattern\6*\16BufWinLeave\rcallback\0\1\0\1\fpattern\6*\16BufWinEnter\24nvim_create_autocmd\bapi\bvim\1\0\1\rtabpages\1\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/home/tarik/.local/share/nvim/site/pack/packer/start/barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  ["feline.nvim"] = {
    config = { "\27LJ\2\2Ñ\2\0\0\4\0\6\0\t5\0\0\0006\1\1\0'\2\2\0B\1\2\0029\2\3\0015\3\4\0=\0\5\3B\2\2\1K\0\1\0\ntheme\1\0\0\nsetup\vfeline\frequire\1\0\r\vviolet\f#b16286\nblack\f#1B1B1B\fskyblue\f#458588\fmagenta\f#fb4934\ngreen\f#689d6a\14oceanblue\f#1d2021\afg\f#928374\abg\f#1F2223\vorange\f#fabd2f\tcyan\f#83a597\vyellow\f#d79921\bred\f#cc241d\nwhite\f#ebdbb2\0" },
    loaded = true,
    path = "/home/tarik/.local/share/nvim/site/pack/packer/start/feline.nvim",
    url = "https://github.com/feline-nvim/feline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\2W\0\4\t\1\4\0\14\14\0\3\0X\4\1Ä4\3\0\0-\4\0\0=\4\0\0036\4\1\0009\4\2\0049\4\3\4\18\5\0\0\18\6\1\0\18\a\2\0\18\b\3\0B\4\5\1K\0\1\0\0¿\bset\vkeymap\bvim\vbuffer#\0\0\1\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14next_hunkg\1\0\2\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2Ä'\0\3\0002\0\aÄ6\0\0\0009\0\4\0003\1\5\0B\0\2\1'\0\6\0002\0\0ÄL\0\2\0L\0\2\0\1¿\r<Ignore>\0\rschedule\a]c\tdiff\awo\bvim#\0\0\1\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14prev_hunkg\1\0\2\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2Ä'\0\3\0002\0\aÄ6\0\0\0009\0\4\0003\1\5\0B\0\2\1'\0\6\0002\0\0ÄL\0\2\0L\0\2\0\1¿\r<Ignore>\0\rschedule\a[c\tdiff\awo\bvim1\0\0\2\1\2\0\5-\0\0\0009\0\0\0005\1\1\0B\0\2\1K\0\1\0\1¿\1\0\1\tfull\2\15blame_line‡\3\1\1\b\0\27\00056\1\0\0009\1\1\0019\1\2\0013\2\3\0\18\3\2\0'\4\4\0'\5\5\0003\6\6\0005\a\a\0B\3\5\1\18\3\2\0'\4\4\0'\5\b\0003\6\t\0005\a\n\0B\3\5\1\18\3\2\0005\4\v\0'\5\f\0'\6\r\0B\3\4\1\18\3\2\0005\4\14\0'\5\15\0'\6\16\0B\3\4\1\18\3\2\0'\4\4\0'\5\17\0009\6\18\1B\3\4\1\18\3\2\0'\4\4\0'\5\19\0009\6\20\1B\3\4\1\18\3\2\0'\4\4\0'\5\21\0003\6\22\0B\3\4\1\18\3\2\0'\4\4\0'\5\23\0009\6\24\1B\3\4\1\18\3\2\0'\4\4\0'\5\25\0009\6\26\1B\3\4\0012\0\0ÄK\0\1\0\rdiffthis\15<leader>hd\30toggle_current_line_blame\15<leader>tb\0\15<leader>hb\17preview_hunk\15<leader>hp\20undo_stage_hunk\15<leader>hu\29:Gitsigns reset_hunk<CR>\15<leader>hr\1\3\0\0\6n\6v\29:Gitsigns stage_hunk<CR>\15<leader>hs\1\3\0\0\6n\6v\1\0\1\texpr\2\0\a[c\1\0\1\texpr\2\0\a]c\6n\0\rgitsigns\vloaded\fpackageP\1\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0003\2\3\0=\2\5\1B\0\2\1K\0\1\0\14on_attach\1\0\0\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/tarik/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["goyo.vim"] = {
    loaded = true,
    path = "/home/tarik/.local/share/nvim/site/pack/packer/start/goyo.vim",
    url = "https://github.com/junegunn/goyo.vim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\2π\1\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\5\31show_current_context_start\2\28show_first_indent_level\1\25show_current_context\2\tchar\b‚îÜ#show_trailing_blankline_indent\1\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/home/tarik/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/home/tarik/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\2@\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/tarik/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\2\2:\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17nvim_comment\frequire\0" },
    loaded = true,
    path = "/home/tarik/.local/share/nvim/site/pack/packer/start/nvim-comment",
    url = "https://github.com/terrortylor/nvim-comment"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\2;\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "/home/tarik/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle", "NvimTreeFindFile" },
    config = { "\27LJ\2\2è\1\0\0\4\0\b\0\v6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\6\0005\2\3\0005\3\4\0=\3\5\2=\2\a\1B\0\2\1K\0\1\0\ffilters\1\0\2\16open_on_tab\2\18hijack_cursor\2\vcustom\1\2\0\0\t.git\1\0\1\rdotfiles\1\nsetup\14nvim-tree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/tarik/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\2Ú\1\0\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\1B\0\2\1K\0\1\0\21ensure_installed\1\0\1\17auto_install\2\1\21\0\0\bcss\15dockerfile\thtml\15javascript\njsdoc\tjson\njson5\blua\tmake\rmarkdown\nninja\bphp\vpython\nregex\truby\tscss\bsql\btsx\15typescript\tyaml\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/tarik/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/tarik/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    config = { "\27LJ\2\2`\0\0\2\0\5\0\f6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\0016\0\0\0'\1\1\0B\0\2\0029\0\4\0B\0\1\1K\0\1\0\tload\1\0\1\nstyle\twarm\nsetup\fonedark\frequire\0" },
    loaded = true,
    path = "/home/tarik/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/tarik/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/tarik/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/tarik/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/tarik/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-visual-star-search"] = {
    loaded = true,
    path = "/home/tarik/.local/share/nvim/site/pack/packer/start/vim-visual-star-search",
    url = "https://github.com/nelstrom/vim-visual-star-search"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\2Ú\1\0\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\1B\0\2\1K\0\1\0\21ensure_installed\1\0\1\17auto_install\2\1\21\0\0\bcss\15dockerfile\thtml\15javascript\njsdoc\tjson\njson5\blua\tmake\rmarkdown\nninja\bphp\vpython\nregex\truby\tscss\bsql\btsx\15typescript\tyaml\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: barbar.nvim
time([[Config for barbar.nvim]], true)
try_loadstring("\27LJ\2\2Å\1\0\0\3\0\b\0\r6\0\0\0009\0\1\0009\0\2\0\a\0\3\0X\0\aÄ6\0\4\0'\1\5\0B\0\2\0029\0\6\0)\1\31\0'\2\a\0B\0\3\1K\0\1\0\rFileTree\15set_offset\21bufferline.state\frequire\rNvimTree\rfiletype\abo\bvimò\1\0\0\3\0\t\0\0186\0\0\0009\0\1\0009\0\2\0'\1\3\0B\0\2\2\18\1\0\0009\0\4\0'\2\5\0B\0\3\2\15\0\0\0X\1\6Ä6\0\6\0'\1\a\0B\0\2\0029\0\b\0)\1\0\0B\0\2\1K\0\1\0\15set_offset\21bufferline.state\frequire\rNvimTree\nmatch\f<afile>\vexpand\afn\bvim‚\1\1\0\4\0\14\0\0236\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\1\a\0005\2\b\0003\3\t\0=\3\n\2B\0\3\0016\0\4\0009\0\5\0009\0\6\0'\1\v\0005\2\f\0003\3\r\0=\3\n\2B\0\3\1K\0\1\0\0\1\0\1\fpattern\6*\16BufWinLeave\rcallback\0\1\0\1\fpattern\6*\16BufWinEnter\24nvim_create_autocmd\bapi\bvim\1\0\1\rtabpages\1\nsetup\15bufferline\frequire\0", "config", "barbar.nvim")
time([[Config for barbar.nvim]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\2;\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: nvim-comment
time([[Config for nvim-comment]], true)
try_loadstring("\27LJ\2\2:\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17nvim_comment\frequire\0", "config", "nvim-comment")
time([[Config for nvim-comment]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\2W\0\4\t\1\4\0\14\14\0\3\0X\4\1Ä4\3\0\0-\4\0\0=\4\0\0036\4\1\0009\4\2\0049\4\3\4\18\5\0\0\18\6\1\0\18\a\2\0\18\b\3\0B\4\5\1K\0\1\0\0¿\bset\vkeymap\bvim\vbuffer#\0\0\1\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14next_hunkg\1\0\2\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2Ä'\0\3\0002\0\aÄ6\0\0\0009\0\4\0003\1\5\0B\0\2\1'\0\6\0002\0\0ÄL\0\2\0L\0\2\0\1¿\r<Ignore>\0\rschedule\a]c\tdiff\awo\bvim#\0\0\1\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14prev_hunkg\1\0\2\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2Ä'\0\3\0002\0\aÄ6\0\0\0009\0\4\0003\1\5\0B\0\2\1'\0\6\0002\0\0ÄL\0\2\0L\0\2\0\1¿\r<Ignore>\0\rschedule\a[c\tdiff\awo\bvim1\0\0\2\1\2\0\5-\0\0\0009\0\0\0005\1\1\0B\0\2\1K\0\1\0\1¿\1\0\1\tfull\2\15blame_line‡\3\1\1\b\0\27\00056\1\0\0009\1\1\0019\1\2\0013\2\3\0\18\3\2\0'\4\4\0'\5\5\0003\6\6\0005\a\a\0B\3\5\1\18\3\2\0'\4\4\0'\5\b\0003\6\t\0005\a\n\0B\3\5\1\18\3\2\0005\4\v\0'\5\f\0'\6\r\0B\3\4\1\18\3\2\0005\4\14\0'\5\15\0'\6\16\0B\3\4\1\18\3\2\0'\4\4\0'\5\17\0009\6\18\1B\3\4\1\18\3\2\0'\4\4\0'\5\19\0009\6\20\1B\3\4\1\18\3\2\0'\4\4\0'\5\21\0003\6\22\0B\3\4\1\18\3\2\0'\4\4\0'\5\23\0009\6\24\1B\3\4\1\18\3\2\0'\4\4\0'\5\25\0009\6\26\1B\3\4\0012\0\0ÄK\0\1\0\rdiffthis\15<leader>hd\30toggle_current_line_blame\15<leader>tb\0\15<leader>hb\17preview_hunk\15<leader>hp\20undo_stage_hunk\15<leader>hu\29:Gitsigns reset_hunk<CR>\15<leader>hr\1\3\0\0\6n\6v\29:Gitsigns stage_hunk<CR>\15<leader>hs\1\3\0\0\6n\6v\1\0\1\texpr\2\0\a[c\1\0\1\texpr\2\0\a]c\6n\0\rgitsigns\vloaded\fpackageP\1\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0003\2\3\0=\2\5\1B\0\2\1K\0\1\0\14on_attach\1\0\0\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: onedark.nvim
time([[Config for onedark.nvim]], true)
try_loadstring("\27LJ\2\2`\0\0\2\0\5\0\f6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\0016\0\0\0'\1\1\0B\0\2\0029\0\4\0B\0\1\1K\0\1\0\tload\1\0\1\nstyle\twarm\nsetup\fonedark\frequire\0", "config", "onedark.nvim")
time([[Config for onedark.nvim]], false)
-- Config for: feline.nvim
time([[Config for feline.nvim]], true)
try_loadstring("\27LJ\2\2Ñ\2\0\0\4\0\6\0\t5\0\0\0006\1\1\0'\2\2\0B\1\2\0029\2\3\0015\3\4\0=\0\5\3B\2\2\1K\0\1\0\ntheme\1\0\0\nsetup\vfeline\frequire\1\0\r\vviolet\f#b16286\nblack\f#1B1B1B\fskyblue\f#458588\fmagenta\f#fb4934\ngreen\f#689d6a\14oceanblue\f#1d2021\afg\f#928374\abg\f#1F2223\vorange\f#fabd2f\tcyan\f#83a597\vyellow\f#d79921\bred\f#cc241d\nwhite\f#ebdbb2\0", "config", "feline.nvim")
time([[Config for feline.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\2@\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\2π\1\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\5\31show_current_context_start\2\28show_first_indent_level\1\25show_current_context\2\tchar\b‚îÜ#show_trailing_blankline_indent\1\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeFindFile lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeFindFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
