{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      terminal = {
        shell = "${pkgs.zsh}/bin/zsh";
      };

      env = {
        "TERM" = "xterm-256color";
      };

      window = {
        padding.x = 10;
        padding.y = 10;
        decorations = "buttonless";
      };

      # font = {
      #   size = 12;
      #   normal.family = "FiraCode Nerd Font";
      #   bold.family = "FiraCode Nerd Font";
      #   italic.family = "FiraCode Nerd Font";
      # };
    };
  };
}
