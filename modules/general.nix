{ inputs, ... }:
{
  imports = [
    inputs.catppuccin.homeModules.catppuccin
  ];

  catppuccin = {
    enable = true;
    bat = {
      flavor = "macchiato";
    };
    fcitx5 = {
      enableRounded = true;
    };
    nvim = {
      flavor = "macchiato";
    };
  };
}
