# dotfiles

My macOS configuration managed with nix-darwin + home-manager.

## Structure

- **`flake.nix`** - Main entry point
- **`nix-darwin/configuration.nix`** - System settings
- **`nix-darwin/homebrew.nix`** - Homebrew casks and brews
- **`home-manager/home.nix`** - Packages and program configuration

## Setup

1. Install [Nix](https://nixos.org/download/)

2. Clone this repository:

   ```sh
   git clone https://github.com/t3yamoto/dotfiles ~/dev/github.com/t3yamoto/dotfiles
   cd ~/dev/github.com/t3yamoto/dotfiles
   ```

3. Apply the configuration:

   ```sh
   sudo darwin-rebuild switch --flake .
   ```

4. Set up manually managed files:

   - Create `~/.config/git/config_private` for organization-specific ghq settings
   - Run `gh auth login` for GitHub authentication
   - Enable 1Password SSH Agent in Settings → Developer

## Usage

```sh
# Apply changes
sudo darwin-rebuild switch --flake .
```

