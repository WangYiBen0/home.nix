{ pkgs, NixVim, ... }:
{
  home.packages = [
    NixVim.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
