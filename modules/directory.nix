{
  config,
  lib,
  ...
}:

let
  links = {
    "桌面" = "desktop";
    "文档" = "documents";
    "下载" = "download";
    "音乐" = "music";
    "图片" = "pictures";
    "视频" = "videos";
    "模板" = "templates";
    "公共" = "publicShare";
  };
in
{
  xdg.userDirs = {
    enable = true;
    # createDirectories = true; # 可能导致现有程序崩溃，造成大批量重启淹没终端输出
    setSessionVariables = true;
  };

  home.file = lib.mapAttrs (_chineseName: xdgKey: {
    source = config.lib.file.mkOutOfStoreSymlink config.xdg.userDirs.${xdgKey};
  }) links;
}
