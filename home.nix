{ inputs, ... }:

{
  imports = [
    ./modules
    { nixpkgs.overlays = import ./overlays inputs; }
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
