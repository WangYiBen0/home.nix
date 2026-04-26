{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
    plugins = {
      inherit (pkgs.yaziPlugins)
        git
        sudo
        chmod
        full-border
        starship
        ;
    };

    initLua = ''
      require("full-border"):setup()
      require("git"):setup()
    '';
  };
}
