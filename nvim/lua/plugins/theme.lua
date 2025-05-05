return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "night",
      transparent = false,
    })
    vim.cmd([[colorscheme tokyonight]])
    -- Override the Normal highlight group to use black background
    local black_bg = "#11111B"
    vim.api.nvim_set_hl(0, "Normal", { bg = black_bg, fg = "#c0caf5" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = black_bg })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = black_bg })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = black_bg })
    vim.api.nvim_set_hl(0, "StatusLine", { bg = black_bg })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = black_bg })

  end
}
