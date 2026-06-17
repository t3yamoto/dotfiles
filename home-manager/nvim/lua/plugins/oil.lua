return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    config = function()
      require("oil").setup()
      vim.keymap.set("n", "<leader>o", "<cmd>Oil<cr>", { desc = "Open oil" })
    end,
  },
}
