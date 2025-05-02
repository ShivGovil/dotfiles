return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "night",
      transparent = false, -- Make sure this is false
      styles = {
        sidebars = { bg = "black" },
        floats = { bg = "black" },
      },
      colors = {
        bg = "#000000", -- Pure black
        bg_dark = "#000000",
        bg_float = "#000000",
        bg_highlight = "#000000",
        bg_popup = "#000000",
        bg_sidebar = "#000000",
        bg_statusline = "#000000",
        bg_visual = "#1a1b26", -- Keep some contrast for visual selection
      },
    })

    vim.cmd([[colorscheme tokyonight]])

    -- Override highlights after colorscheme is applied
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        -- Normal backgrounds
        vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "#000000" })

        -- UI elements
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "#000000" })
        vim.api.nvim_set_hl(0, "LineNr", { bg = "#000000" })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "#000000" })
        vim.api.nvim_set_hl(0, "Pmenu", { bg = "#000000" })
        vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#000000" })
        vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#000000" })

        -- Telescope specific
        vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#000000" })
        vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#444444", bg = "#000000" })
        vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "#000000" })
        vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#444444", bg = "#000000" })
        vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "#000000" })
        vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#444444", bg = "#000000" })
        vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "#000000" })
        vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#444444", bg = "#000000" })
      end,
    })
  end
}
