return {
  {
    "oxidescheme/nvim",
    name = "oxide",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "oxide"
    end,
  },
}
