return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "go",
        "json",
        "lua",
        "markdown",
        "nix",
        "python",
        "toml",
        "typescript",
        "yaml",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}
