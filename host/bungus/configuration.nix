{
  imports = [
    ../bundles/global
    ./hardware-configuration.nix
  ];

  networking.hostName = "bungus"; # Define your hostname.
  system.stateVersion = "24.05";
}
