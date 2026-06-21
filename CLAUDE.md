# CLAUDE.md

## Applying changes

Run `sudo darwin-rebuild switch --flake .` to apply any configuration changes.

## Package management policy

- CLI tools: `home.packages` or `programs.*` (use `programs.*` when shell integration is needed; check availability at https://github.com/nix-community/home-manager/tree/master/modules/programs)
- Language runtimes: mise (`home-manager/mise/config.toml`)
- Config files: `xdg.configFile`
- GUI apps: Homebrew cask
- Credentials and machine-specific settings: unmanaged

## Files not managed by nix

- `~/.config/git/config_private` — organization-specific ghq settings
- `~/.config/gh/` — GitHub CLI auth (managed by `gh auth login`)

