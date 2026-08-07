{
  nix-homebrew,
  ...
}:
{
  nix-homebrew = {
    enable = true;
    user = "t3yamoto";
    enableRosetta = false;
    autoMigrate = true;
  };

  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      autoUpdate = false;
      upgrade = false;
    };

    brews = [
      "borders"
      "crit"
      "herdr"
      "hunk"
      "ollama"
    ];

    casks = [
      "1password"
      "entireio/tap/entire"
      "claude"
      "docker-desktop"
      "aws-vpn-client"
      "azookey"
      "choosy"
      "contexts"
      "font-udev-gothic-nf"
      "ghostty"
      "google-chrome"
      "numi"
      "obsidian"
      "raycast"
      "shottr"
      "slack"
      "spotify"
    ];

    taps = [
      "FelixKratz/formulae"
      "entireio/tap"
    ];
  };
}

