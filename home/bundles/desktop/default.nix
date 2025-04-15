{ pkgs, ... }:
{
  imports = [
    ./alacritty.nix
    ./flameshot.nix
  ];

  systemd.user.targets.tray = {
    Unit = {
      Description = "Home Manager System Tray";
      Requires = [ "graphical-session-pre.target" ];
    };
  };

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    alacritty
    discord
    obsidian
    firefox
    spotify

    nerd-fonts.inconsolata
    nerd-fonts.fira-code
  ];
}
