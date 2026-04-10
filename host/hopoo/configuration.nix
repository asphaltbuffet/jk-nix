{
  imports = [
    ../bundles/global
    ../bundles/desktop
    ./hardware-configuration.nix
  ];

  services.xserver.videoDrivers = [
    "displaylink"
  ];

  networking.hostName = "hopoo"; # Define your hostname.
  system.stateVersion = "24.05";
}
