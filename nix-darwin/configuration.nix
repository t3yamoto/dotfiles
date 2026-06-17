{
  self,
  pkgs,
  ...
}:
{
  users.users.t3yamoto.home = "/Users/t3yamoto";
  nixpkgs.hostPlatform = "aarch64-darwin";
  nix.enable = false;
  programs.zsh.enable = true;
  security.pam.services.sudo_local.touchIdAuth = true;

  nixpkgs.config.allowUnfreePredicate = (
    pkg:
    builtins.elem (pkgs.lib.getName pkg) [
      "claude-code"
    ]
  );

  imports = [
    ./home_manager.nix
    ./homebrew.nix
  ];

  system = {
    stateVersion = 7;
    configurationRevision = self.rev or self.dirtyRev or null;
    primaryUser = "t3yamoto";

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
    
    defaults = {
      NSGlobalDomain = {
        AppleMeasurementUnits = "Centimeters";
        AppleMetricUnits = 1;

        InitialKeyRepeat = 20;
        KeyRepeat = 2;
        "com.apple.keyboard.fnState" = true;
      };
      trackpad = {
        Clicking = true;
        TrackpadRightClick = true;
        TrackpadThreeFingerDrag = true;
      };
      dock = {
        autohide = true;
        autohide-delay = 3.0;
        tilesize = 50;
        wvous-br-corner = 13;
      };

      finder = {
        AppleShowAllExtensions = true;
        ShowPathbar = true;
        ShowStatusBar = true;
        FXEnableExtensionChangeWarning = false;
        FXPreferredViewStyle = "Nlsv";
        _FXShowPosixPathInTitle = true;
      };

      menuExtraClock = {
        Show24Hour = true;
        ShowDate = 1;
        ShowDayOfMonth = true;
        ShowDayOfWeek = true;
        ShowSeconds = true;
      };

      CustomUserPreferences = {
        NSGlobalDomain = {
          AppleLanguages = [
            "en-JP"
            "ja-JP"
          ];
          AppleLocale = "ja-JP";
        };
        "com.apple.symbolichotkeys" = {
          AppleSymbolicHotKeys = {
            "60" = {
              enabled = 0;
              value = {
                parameters = [ 32 49 786432 ];
                type = "standard";
              };
            };
            "61" = {
              enabled = 1;
              value = {
                parameters = [ 32 49 1048576 ];
                type = "standard";
              };
            };
            "64" = {
              enabled = 0;
              value = {
                parameters = [ 32 49 1048576 ];
                type = "standard";
              };
            };
          };
        };
      };
    };
  };
}

