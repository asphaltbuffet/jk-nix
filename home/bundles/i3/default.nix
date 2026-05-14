{ pkgs, pkgs-stable, ... }:
{
  imports = [
    ./i3.nix
    ./i3status-rust.nix
    ./rofi.nix
    ./stylix.nix
    ./picom.nix
  ];

  home.packages =
    (with pkgs; [
      # Tray applets
      networkmanagerapplet
      blueman
      pasystray
      pavucontrol

      # Utilities
      feh
      xss-lock
      arandr
      playerctl
      brightnessctl
    ])
    ++ [
      # unstable's flameshot 14 hangs on xdg-desktop-portal; stable is 12.x
      pkgs-stable.flameshot
    ];

  services.dunst.enable = true;
}
