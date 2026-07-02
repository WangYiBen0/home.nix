{ inputs, ... }: {
  imports = [
    inputs.catppuccin.homeModules.catppuccin
    inputs.nix-index-database.homeModules.nix-index
    inputs.zen-browser.homeModules.beta

    ./directory.nix
    ./file.nix
    ./font.nix
    ./identity.nix
    ./ime.nix
    ./kitty.nix
    ./niri.nix
    ./nix.nix
    ./nix-index.nix
    ./nixvim.nix
    ./packages.nix
    ./shell.nix
    ./starship.nix
    ./theme.nix
    ./variable.nix
    ./yazi.nix
  ];
}
