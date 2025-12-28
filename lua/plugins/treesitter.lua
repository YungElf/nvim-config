return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
    local ok, configs = pcall(require, "nvim-treesitter.configs")
    if not ok then
      vim.notify("nvim-treesitter.configs not found (treesitter plugin not loaded)", vim.log.levels.WARN)
      return
      end

      configs.setup({
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
      end,
  },
}
