{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    settings = {
      command = "${pkgs.zellij}/bin/zellij";

      window-padding-x = 10;
      window-padding-y = 10;
      window-decoration = false;
    };
  };

  home.sessionVariables = {
    TERM = "xterm-256color";
  };
}
