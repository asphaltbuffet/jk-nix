{ config, pkgs, ... }:
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
  ];

  hardware = {
    graphics.enable = true;
    system76.enableAll = true;

    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      powerManagement.finegrained = true;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      prime = {
        offload.enable = true;
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    (writeShellScriptBin "nvidia-offload" ''
      export __NV_PRIME_RENDER_OFFLOAD=1
      export __GLX_VENDOR_LIBRARY_NAME=nvidia
      exec "$@"
    '')
    cudaPackages.cudatoolkit
    cudaPackages.cudnn
  ];

  services.power-profiles-daemon.enable = false;

  services.tailscale.enable = true;

  virtualisation.docker.enable = true;

  system.stateVersion = "24.11";
}
