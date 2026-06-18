vim.cmd("source " .. vim.fn.expand("~/.config/vim/vimrc"))

vim.opt.splitright = true

vim.keymap.set("n", "<C-w>-", "<C-w>s", { desc = "Split horizontal" })
vim.keymap.set("n", "<C-w>|", "<C-w>v", { desc = "Split vertical" })

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
})
