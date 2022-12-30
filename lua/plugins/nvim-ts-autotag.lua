-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")

if not status then
  return
end

treesitter.setup {
  autotag = {
    enable = true,
  }
}
