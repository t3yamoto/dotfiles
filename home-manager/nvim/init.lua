vim.cmd("source " .. vim.fn.expand("~/.config/vim/vimrc"))

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
})
