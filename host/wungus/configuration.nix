{ config, ... }:
{
  imports = [
    ../bundles/global
    ../bundles/desktop
    ./hardware-configuration.nix
  ];
  networking.hostName = "wungus";

  boot.initrd.luks.devices."luks-94984eb9-c989-424d-b636-a57f7086e0f7".device =
    "/dev/disk/by-uuid/94984eb9-c989-424d-b636-a57f7086e0f7";

  # System 76 adder-ws specific hardware configuration
  # including nvidia and system76 firmware
  services.xserver.videoDrivers = [
    "nvidia"
    "displaylink"
    "modesetting"
  ];

  hardware = {
    graphics.enable = true;
    system76.enableAll = true;

    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      open = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };
  };

  services.power-profiles-daemon.enable = false;

  services.tailscale.enable = true;

  virtualisation.docker.enable = true;

  system.stateVersion = "24.11";
}
