{ pkgs, ... }:
{
  programs = {
    bash.enable = true;
    zsh.enable = true;
    fish = {
      enable = true;
      functions = {
        fish_greeting = "";
      };
    };

    eza = {
      enable = true;
      icons = "auto";
    };

    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        batman
        batwatch
      ];
    };
  };

  home.shellAliases = {
    clear = "printf '\033[2J\033[3J\033[1;1H'";
    cat = "bat --paging never --style plain";
    man = "batman";
  };
}
