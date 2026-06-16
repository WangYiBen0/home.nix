{
  pkgs,
  lib,
  inputs,
  ...
}:
{
  home.packages = with pkgs; [
    maple-mono.NF-CN
    noto-fonts-cjk-sans
    source-han-serif
    smiley-sans
    lxgw-wenkai
    lxgw-wenkai-screen
    lxgw-neoxihei
    lxgw-neozhisong
    lxgw-zhenkai
    zhuque-fangsong
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
          "LXGW Neo ZhiSong"
          "Source Han Serif SC"
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
            <?xml version='1.0'?>

            <!-- Linked by Home Manager. -->

            <!DOCTYPE fontconfig SYSTEM 'urn:fontconfig:fonts.dtd'>
            <fontconfig>
            <description>Add alias to some common Chinese fonts from Windows</description>
              <!-- Aliases -->

              <!-- 黑体 / SimHei (Sans-serif) -->

              <match target="pattern">
                  <test qual="any" name="family">
                      <string>Microsoft YaHei</string>
                      <string>微软雅黑</string>
                  </test>
                  <edit name="family" mode="assign" binding="strong">
                      <string>Source Han Sans SC</string>
                  </edit>
              </match>

              <match target="pattern">
                  <test qual="any" name="family">
                      <string>SimHei</string>
                      <string>黑体</string>
                  </test>
                  <edit name="family" mode="assign" binding="strong">
                      <string>LXGW Neo XiHei</string>
                  </edit>
              </match>

              <!-- 宋体 / SimSun (Serif) -->

              <alias>
                <family>SimSun</family>
                <prefer>
                  <family>LXGW Neo ZhiSong</family>
                </prefer>
              </alias>

              <alias>
                <family>宋体</family>
                <prefer>
                  <family>LXGW Neo ZhiSong</family>
                </prefer>
              </alias>

              <!-- 楷体 / KaiTi -->

              <alias>
                <family>KaiTi</family>
                <prefer>
                  <family>LXGW ZhenKai GB</family>
                </prefer>
              </alias>

              <alias>
                <family>楷体</family>
                <prefer>
                  <family>LXGW ZhenKai GB</family>
                </prefer>
              </alias>

              <alias>
                <family>KaiTi_GB2312</family>
                <prefer>
                  <family>LXGW ZhenKai GB</family>
                </prefer>
              </alias>

              <alias>
                <family>楷体_GB2312</family>
                <prefer>
                  <family>LXGW ZhenKai GB</family>
                </prefer>
              </alias>

              <!-- 仿宋 / FangSong -->

              <alias>
                <family>FangSong</family>
                <prefer>
                  <family>Zhuque FangSong (technical preview)</family>
                </prefer>
              </alias>

              <alias>
                <family>仿宋</family>
                <prefer>
                  <family>Zhuque FangSong (technical preview)</family>
                </prefer>
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
