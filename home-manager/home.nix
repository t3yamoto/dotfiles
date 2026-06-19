{ pkgs, ... }:

{
  home.username = "t3yamoto";
  home.homeDirectory = "/Users/t3yamoto";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    awscli2
    claude-code
    curl
    delta
    envchain
    fd
    fzf
    gemini-cli
    gh
    ghq
    gibo
    git
    git-remote-codecommit
    git-wt
    gitleaks
    jq
    gopls
    lua-language-server
    nil
    pyright
    ripgrep
    tree
    typescript-language-server
    vim
  ];

  programs.zsh = {
    enable = true;
    shellAliases = {
      rm = "rm -i";
      ls = "ls -G";
      la = "ls -la";
    };
    initContent = builtins.readFile ./zsh/init.zsh;
  };

  programs.bat = {
    enable = true;
    config.theme = "Nord";
  };

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      search_mode = "fulltext";
      filter_mode = "directory";
      store_failed = false;
    };
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.mise = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      lazy-nvim
    ];
  };

  programs.watson = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      options = {
        stop_on_start = true;
        confirm_new_project = true;
      };
    };
  };

  xdg.configFile."git/config".source = ./git/config;
  xdg.configFile."git/config_work".source = ./git/config_work;
  xdg.configFile."git/allowed_signers".source = ./git/allowed_signers;
  xdg.configFile."git/ignore".source = ./git/ignore;
  xdg.configFile."git/hooks/pre-commit" = {
    source = ./git/hooks/pre-commit;
    executable = true;
  };
  xdg.configFile."mise/config.toml".source = ./mise/config.toml;
  xdg.configFile."borders/bordersrc" = {
    source = ./borders/bordersrc;
    executable = true;
  };
  xdg.configFile."raycast/scripts/ime-off.sh" = {
    source = ./raycast/scripts/ime-off.sh;
    executable = true;
  };
  xdg.configFile."vim/vimrc".source = ./vim/vimrc;
  xdg.configFile."nvim/init.lua".source = ./nvim/init.lua;
  xdg.configFile."nvim/lua/plugins/colorscheme.lua".source = ./nvim/lua/plugins/colorscheme.lua;
  xdg.configFile."nvim/lua/plugins/treesitter.lua".source = ./nvim/lua/plugins/treesitter.lua;
  xdg.configFile."nvim/lua/plugins/lsp.lua".source = ./nvim/lua/plugins/lsp.lua;
  xdg.configFile."nvim/lua/plugins/snacks.lua".source = ./nvim/lua/plugins/snacks.lua;
  xdg.configFile."nvim/lua/plugins/icons.lua".source = ./nvim/lua/plugins/icons.lua;
  xdg.configFile."nvim/lua/plugins/oil.lua".source = ./nvim/lua/plugins/oil.lua;
  xdg.configFile."nvim/lua/plugins/lualine.lua".source = ./nvim/lua/plugins/lualine.lua;
  xdg.configFile."wezterm/wezterm.lua".source = ./wezterm/wezterm.lua;

  home.sessionVariables = {
    EDITOR = "vim";
    PAGER = "less";
    LANG = "ja_JP.UTF-8";
    DO_NOT_TRACK = "1";
    SSH_AUTH_SOCK = "$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock";
  };

  programs.home-manager.enable = true;
}
