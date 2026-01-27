{ pkgs, ... }:
{
  imports = [
    ./alacritty.nix

    # removing for now until we figure out wayland stuff :(
    # ./flameshot.nix
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
    signal-desktop
    spotify

    nerd-fonts.inconsolata
    nerd-fonts.fira-code
  ];
}
