{ pkgs, ... }:
{
  nix = {
    package = pkgs.lix;
    settings = {
      extra-substituters = [ "https://catppuccin.cachix.org" ];
      extra-trusted-public-keys = [
        "catppuccin.cachix.org-1:noG7IOfvY97SUs69IosE9vN58Lls6H8N2VpLNoB40vE="
      ];
    };
  };
}
