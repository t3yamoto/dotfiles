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
      "ollama"
    ];

    casks = [
      "1password"
      "docker"
      "aws-vpn-client"
      "azookey"
      "choosy"
      "contexts"
      "font-udev-gothic-nf"
      "google-chrome"
      "numi"
      "obsidian"
      "raycast"
      "shottr"
      "slack"
      "spotify"
      "wezterm@nightly"
    ];

    taps = [
      "FelixKratz/formulae"
    ];
  };
}

