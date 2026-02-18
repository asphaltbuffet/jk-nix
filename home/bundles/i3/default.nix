{ pkgs, ... }:
{
  imports = [
    ./i3.nix
    ./i3status-rust.nix
    ./rofi.nix
    ./autorandr.nix
    ./stylix.nix
    ./picom.nix
  ];

  home.packages = with pkgs; [
    # Tray applets
    networkmanagerapplet
    blueman
    pasystray
    pavucontrol

    # Utilities
    feh
    xss-lock
    arandr
    flameshot
    playerctl
    brightnessctl
  ];

  services.dunst.enable = true;
}
