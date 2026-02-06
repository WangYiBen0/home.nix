{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    plugins = {
      git = pkgs.yaziPlugins.git;
      sudo = pkgs.yaziPlugins.sudo;
      chmod = pkgs.yaziPlugins.chmod;
      full-border = pkgs.yaziPlugins.full-border;
      starship = pkgs.yaziPlugins.starship;
    };

    initLua = ''
      require("full-border"):setup()
      require("git"):setup()
    '';
  };
}
