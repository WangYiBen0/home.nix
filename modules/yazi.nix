{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    # 启用插件
    plugins = {
      git = pkgs.yaziPlugins.git;
      sudo = pkgs.yaziPlugins.sudo;
      chmod = pkgs.yaziPlugins.chmod;
      full-border = pkgs.yaziPlugins.full-border;
      starship = pkgs.yaziPlugins.starship;
      # smart-enter = pkgs.yaziPlugins.smart-enter;
      # lazygit = pkgs.yaziPlugins.lazygit;
    };

    initLua = ''
      require("full-border"):setup()
      require("git"):setup()
    '';

    # 如果需要自定义配置，可以在 keymap.manager.prepend_keymap 里绑定
    # keymap.manager.prepend_keymap = [
    #   { on = [ "g" "i" ]; run = "plugin git"; desc = "Git status"; }
    # ];

    # keymap = {
    #   manager.prepend_keymap = [
    #     {
    #       on = [ "c" "m" ];
    #       run = "plugin chmod";
    #       desc = "Chmod on selected files";
    #     }
    #     {
    #       on = [ "l" ];
    #       run = "plugin smart-enter";
    #       desc = "Enter directory or open file";
    #     }
    #   ];
    # };
  };
}
