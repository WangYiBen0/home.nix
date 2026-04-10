{ pkgs, ... }:
{
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5 = {
      addons = with pkgs; [
        fcitx5-gtk
        # qt6Packages.fcitx5-chinese-addons
        libsForQt5.fcitx5-qt
        kdePackages.fcitx5-qt
        (fcitx5-rime.override {
          rimeDataPkgs = [
            rime-ice
          ];
        })
        qt6Packages.fcitx5-configtool
        # fcitx5-pinyin-zhwiki
        # fcitx5-pinyin-moegirl
        catppuccin-fcitx5
      ];
      waylandFrontend = true;
    };
  };

  home.file.".local/share/fcitx5/rime/default.custom.yaml".text = ''
    patch:
      schema_list:
        - schema: rime_ice
      __include: rime_ice_suggestion:/
  '';
}
