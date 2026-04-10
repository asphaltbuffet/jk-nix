{ config, pkgs, ... }:
{
  imports = [
    ../bundles/global
    ../bundles/i3
    ./hardware-configuration.nix
  ];
  networking.hostName = "wungus";

  # System 76 adder-ws specific hardware configuration
  # including nvidia and system76 firmware
  services.xserver.videoDrivers = [
    "nvidia"
    "displaylink"
  ];

  hardware = {
    keyboard.zsa.enable = true;
    graphics.enable = true;
    system76.enableAll = true;
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      powerManagement.finegrained = true;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
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
    wally-cli
    keymapp
  ];

  services.libinput.touchpad.disableWhileTyping = true;

  services.power-profiles-daemon.enable = false;

  programs.nix-ld.enable = true;

  services.tailscale.enable = true;

  virtualisation.docker.enable = true;

  system.stateVersion = "24.11";
}
