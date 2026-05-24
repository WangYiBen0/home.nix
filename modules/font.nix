{
  pkgs,
  lib,
  inputs,
  ...
}:
{
  home.packages = with pkgs; [
    maple-mono.NF-CN
    noto-fonts-cjk-serif
    noto-fonts-cjk-sans
    lxgw-wenkai
    lxgw-wenkai-screen
    lxgw-neoxihei
    inputs.apple-fonts.packages.${pkgs.stdenv.hostPlatform.system}.sf-pro
    inputs.apple-fonts.packages.${pkgs.stdenv.hostPlatform.system}.sf-mono
    inputs.apple-fonts.packages.${pkgs.stdenv.hostPlatform.system}.ny
  ];

  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [
          "New York"
          "LXGW WenKai Screen"
          "Noto Serif CJK SC"
        ];
        sansSerif = [
          "SF Pro Display"
          "LXGW Neo XiHei"
          "Noto Sans CJK SC"
        ];
        monospace = [
          "Maple Mono NF CN"
          "SF Mono"
        ];
        emoji = [
          "Noto Color Emoji"
        ];
      };

      configFile = {
        winChsFontAliases = {
          enable = true;
          label = "windows-chinese-font-aliases";
          priority = 60;
          text = ''
            <?xml version="1.0"?>
            <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
            <fontconfig>
                <alias>
                    <family>Microsoft YaHei</family>
                    <prefer><family>Noto Sans CJK SC</family></prefer>
                </alias>
                <alias>
                    <family>微软雅黑</family>
                    <prefer><family>Noto Sans CJK SC</family></prefer>
                </alias>
                <alias>
                    <family>SimSun</family>
                    <prefer><family>Noto Serif CJK SC</family></prefer>
                </alias>
                <alias>
                    <family>宋体</family>
                    <prefer><family>Noto Serif CJK SC</family></prefer>
                </alias>
                <alias>
                    <family>SimHei</family>
                    <prefer><family>LXGW Neo XiHei</family></prefer>
                </alias>
                <alias>
                    <family>黑体</family>
                    <prefer><family>LXGW Neo XiHei</family></prefer>
                </alias>
                <alias>
                    <family>KaiTi</family>
                    <prefer><family>LXGW WenKai</family></prefer>
                </alias>
                <alias>
                    <family>楷体</family>
                    <prefer><family>LXGW WenKai</family></prefer>
                </alias>
            </fontconfig>
          '';
        };
      };
    };
  };

  home.activation.rebuildFontCache = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    ${pkgs.fontconfig}/bin/fc-cache --force --really-force
  '';
}
