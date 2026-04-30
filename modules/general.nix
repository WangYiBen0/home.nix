{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.catppuccin.homeModules.catppuccin
  ];

  home.packages = with pkgs; [
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.qtstyleplugin-kvantum
    whitesur-kde
    whitesur-icon-theme
    whitesur-cursors
    whitesur-gtk-theme
  ];

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

  xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=WhiteSurDark
  '';

  gtk = {
    enable = true;
    iconTheme = {
      name = "WhiteSur-dark";
      package = pkgs.whitesur-icon-theme;
    };
  };

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
    gtk.icon = {
      enable = false;
    };
    kvantum = {
      apply = false;
    };
  };
}
