return {
  {
    "maxmx03/solarized.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.termguicolors = true
      vim.o.background = "dark"
      require("solarized").setup()
      vim.cmd.colorscheme("solarized")
      vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE", ctermbg = "NONE" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", ctermbg = "NONE" })
    end,
  },
}
