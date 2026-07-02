{ pkgs, ... }:
{
  nix = {
    package = pkgs.lix;
    settings = { };
  };

  catppuccin.cache.enable = true;
}
