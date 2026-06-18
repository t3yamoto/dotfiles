return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "solarized_dark",
        globalstatus = true,
      },
      sections = {
        lualine_c = { { "filename", path = 1 } },
      },
    },
  },
}
