return {
  "windwp/nvim-ts-autotag",
  ft = { "html", "javascript", "javascriptreact", "typescriptreact" },
  config = function()
    require("nvim-ts-autotag").setup()
  end,
}
