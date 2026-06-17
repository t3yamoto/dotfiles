vim.cmd("source " .. vim.fn.expand("~/.config/vim/vimrc"))

vim.opt.splitright = true

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
})
