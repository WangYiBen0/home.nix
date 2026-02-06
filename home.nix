{ inputs, ... }:

{
  imports = [
    inputs.stylix.homeModules.stylix
    ./modules
    { nixpkgs.overlays = import ./overlays inputs; }
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
