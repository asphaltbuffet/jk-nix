{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.nixos-hardware.nixosModules.system76
    inputs.nixos-hardware.nixosModules.common-pc-laptop
    ../bundles/global
    ../bundles/i3
    ./hardware-configuration.nix
  ];
  networking.hostName = "wax-quail";

  # System76 Darter Pro 10 (darp10-b) specific hardware configuration
  services.xserver.videoDrivers = [
    "displaylink"
  ];

  hardware = {
    keyboard.zsa.enable = true;
    graphics.enable = true;
    system76.enableAll = true;
  };

  environment.systemPackages = with pkgs; [
    wally-cli
    keymapp
    parted # partprobe, used by baja-yocto's initrd-flash
  ];

  services.libinput.touchpad.disableWhileTyping = true;

  services.power-profiles-daemon.enable = false;

  # baja-yocto's initrd-flash uses udisksctl to mount/unmount the
  # in-target USB storage device exposed during programming. Needs the
  # daemon (this option) and the CLI (provided by the same package).
  # See ~/code/github.com/utilidata/baja-yocto/NIX.md
  services.udisks2.enable = true;

  # Prevent desktop file managers from auto-mounting the in-target USB
  # block device while initrd-flash is using it. Declarative equivalent
  # of baja-yocto's tools/fix_automount.sh.
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="block", ENV{UDISKS_AUTO}="0"
  '';

  programs.nix-ld.enable = true;

  services.tailscale.enable = true;

  virtualisation.docker.enable = true;
  virtualisation.docker.enableOnBoot = false;

  system.stateVersion = "25.11";
}
