{
  imports = [
    ../bundles/global
    ./hardware-configuration.nix
  ];

  networking.hostName = "hopoo"; # Define your hostname.
  system.stateVersion = "24.05";
}
