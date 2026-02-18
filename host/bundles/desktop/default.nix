{ ... }:
{
  imports = [
    ./_base.nix
  ];

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
}
