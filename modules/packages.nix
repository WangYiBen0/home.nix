{ config, pkgs, ... }:
{
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')

    (pkgs.celestegame.override {
      withEverest = true;
      # 必须指定一个可写目录，用于存放 Mods、Saves 和设置
      # 注意：~ 符号在 Nix 配置中通常建议用变量或绝对路径
      writableDir = "/home/${config.home.username}/.local/share/Celeste";
    })
  ];

  programs.btop = {
    enable = true;

    setting = {
      theme_background = false;
    };
  };
}
