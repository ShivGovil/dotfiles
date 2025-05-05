return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    columns = {
      "icon",
      "size",
    },
    view_options = {
      show_hidden = true,
    }
  },
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  lazy = false,

  vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
}
