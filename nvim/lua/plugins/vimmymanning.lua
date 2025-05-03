return {
  {
    "shivgovil/vimmymanning",
    dir = vim.fn.stdpath("config") .. "/lua/plugins/vimmymanning",
    dev = true,
    config = function()
      require("vimmymanning").setup()
    end
  }
}
