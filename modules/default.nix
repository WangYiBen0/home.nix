{ inputs, ... }: {
  imports = [
    inputs.catppuccin.homeModules.catppuccin
    inputs.nix-index-database.homeModules.nix-index
    inputs.nixvim.homeModules.nixvim
    inputs.zen-browser.homeModules.beta

    ./directory.nix
    ./editor.nix
    ./file.nix
    ./font.nix
    ./identity.nix
    ./ime.nix
    ./kitty.nix
    ./niri.nix
    ./nix.nix
    ./nix-index.nix
    ./packages.nix
    ./shell.nix
    ./starship.nix
    ./theme.nix
    ./variable.nix
    ./yazi.nix
  ];
}
