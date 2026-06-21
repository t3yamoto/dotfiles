return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(bufnr)
        local gs = require("gitsigns")
        vim.keymap.set("n", "]h", gs.next_hunk, { buffer = bufnr, desc = "Next hunk" })
        vim.keymap.set("n", "[h", gs.prev_hunk, { buffer = bufnr, desc = "Prev hunk" })
        vim.keymap.set("n", "<leader>gb", gs.blame,         { buffer = bufnr, desc = "Blame file" })
        vim.keymap.set("n", "<leader>gp", gs.preview_hunk,  { buffer = bufnr, desc = "Preview hunk" })
        vim.keymap.set("n", "<leader>gs", gs.stage_hunk,    { buffer = bufnr, desc = "Stage hunk" })
        vim.keymap.set("n", "<leader>gr", gs.reset_hunk,    { buffer = bufnr, desc = "Reset hunk" })
      end,
    },
  },
}
