return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      -- use the night style
      style = "night",
      -- disable italic for functions
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        functions = { italic = false },
      },
    })

    vim.cmd('colorscheme tokyonight')
  end,
}
