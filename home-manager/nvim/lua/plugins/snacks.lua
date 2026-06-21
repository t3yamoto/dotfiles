return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      picker = {
        sources = {
          files = { hidden = true },
          grep = { hidden = true },
        },
      },
      terminal = {
        win = { position = "float", border = "single" },
      },
    },
    keys = {
      { "<leader>ff", function() Snacks.picker.files() end,         desc = "Find files" },
      { "<leader>fg", function() Snacks.picker.grep() end,          desc = "Live grep" },
      { "<leader>fb", function() Snacks.picker.buffers() end,       desc = "Buffers" },
      { "gr",         function() Snacks.picker.lsp_references() end, desc = "LSP references" },
      { "gd",         function() Snacks.picker.lsp_definitions() end, desc = "LSP definitions" },
      { "<leader>so", function() Snacks.picker.lsp_symbols({
          filter = {
            default = {
              "Class", "Constructor", "Enum", "Field", "Function",
              "Interface", "Method", "Module", "Namespace", "Package",
              "Property", "Struct", "Trait", "Variable", "Constant",
            },
          },
        }) end, desc = "LSP symbols (outline)" },
      { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git diff hunks" },
      { "<c-`>",      function() Snacks.terminal() end, desc = "Toggle terminal" },
      { "<c-`>",      function() Snacks.terminal() end, desc = "Toggle terminal", mode = "t" },
    },
  },
}
