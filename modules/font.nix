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
          "Noto Serif CJK SC"
        ];
        sansSerif = [
          "SF Pro Display"
          "Noto Sans CJK SC"
        ];
        monospace = [
          "Maple Mono NF CN"
          "SF Mono"
        ];
      };
    };
  };

  home.activation.rebuildFontCache = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    ${pkgs.fontconfig}/bin/fc-cache --force --really-force
  '';
}
