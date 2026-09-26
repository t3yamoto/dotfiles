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
          explorer = { hidden = true },
        },
      },
      -- must be present (even empty) for snacks to auto-init the netrw
      -- replacement on BufEnter; otherwise stock netrw still opens for dirs.
      explorer = {},
      terminal = {
        win = { position = "float", border = "single" },
      },
    },
    config = function(_, opts)
      require("snacks").setup(opts)

      -- nvim_win_set_hl_ns takes precedence over 'winhighlight', so once it's
      -- assigned to a window, snacks' "NormalFloat:SnacksPickerList" remap is
      -- ignored entirely and plain "NormalFloat" is looked up in this
      -- namespace instead (falling back to global if undefined here).
      local ns = vim.api.nvim_create_namespace("snacks_explorer_transparent")
      vim.api.nvim_set_hl(ns, "NormalFloat", { bg = "none" })
      vim.api.nvim_set_hl(ns, "FloatBorder", { bg = "none" })
      -- the win_hl_ns bypass above also swallows snacks' own
      -- "CursorLine:Visual" remap, so restore a visible selection highlight.
      vim.api.nvim_set_hl(ns, "CursorLine", { link = "Visual", bold = true })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "snacks_picker_list",
        callback = function()
          -- the list window isn't in its final place yet when FileType fires,
          -- so defer and look up the explorer's windows fresh instead of
          -- trusting whatever window is "current" right now.
          vim.schedule(function()
            local picker = Snacks.picker.get({ source = "explorer" })[1]
            if not picker then
              return
            end
            for _, win in ipairs({
              picker.list and picker.list.win and picker.list.win.win,
              picker.input and picker.input.win and picker.input.win.win,
            }) do
              if win and vim.api.nvim_win_is_valid(win) then
                vim.api.nvim_win_set_hl_ns(win, ns)
              end
            end
          end)
        end,
      })
    end,
    keys = {
      { "<leader>e",  function() Snacks.explorer() end,             desc = "Open explorer" },
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
