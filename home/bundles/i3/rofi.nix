{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    terminal = "alacritty";
    extraConfig = {
      show-icons = true;
      icon-theme = "Papirus-Dark";
      modi = "drun,run,window";
      display-drun = "Apps";
      display-run = "Run";
      display-window = "Windows";
    };
  };

  home.packages = with pkgs; [
    papirus-icon-theme
  ];
}
