return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      picker = {},
    },
    keys = {
      { "<leader>ff", function() Snacks.picker.files() end,         desc = "Find files" },
      { "<leader>fg", function() Snacks.picker.grep() end,          desc = "Live grep" },
      { "<leader>fb", function() Snacks.picker.buffers() end,       desc = "Buffers" },
      { "gr",         function() Snacks.picker.lsp_references() end, desc = "LSP references" },
      { "gd",         function() Snacks.picker.lsp_definitions() end, desc = "LSP definitions" },
    },
  },
}
