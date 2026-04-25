{ pkgs, inputs, ... }:
{
  home.packages = [
    inputs.NixVim.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
