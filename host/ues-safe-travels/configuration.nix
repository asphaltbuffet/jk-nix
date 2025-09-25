{ config, pkgs, ... }:
{
  imports = [
    ../bundles/global
    ../bundles/desktop
    ./hardware-configuration.nix
  ];
  networking.hostName = "ues-safe-travels";

  services.xserver.videoDrivers = [
    "nvidia"
    "modesetting"
  ];

  hardware = {
    graphics.enable = true;

    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };

  programs = {
    steam.enable = true;
    noisetorch.enable = true;
    appimage = {
      binfmt = true;
      enable = true;
    };
  };
  
  system.stateVersion = "25.05";
}
