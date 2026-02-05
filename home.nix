{
  _config,
  _pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.catppuccin.homeModules.catppuccin
    inputs.stylix.homeModules.stylix
    ./modules
    { nixpkgs.overlays = import ./overlays inputs; }
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
