{ pkgs, ... }:
{
  imports = [
    ../bundles/global
    ./hardware-configuration.nix
  ];

  networking.hostName = "bungus"; # Define your hostname.
  system.stateVersion = "24.05";

  # Jetson Linux (L4T) flash dependencies
  environment.systemPackages = with pkgs; [
    abootimg
    binutils
    cpio
    dtc
    dosfstools
    lbzip2
    libxml2
    lz4
    netcat-openbsd
    openssl
    parted # partprobe, used by baja-yocto's initrd-flash
    (python3.withPackages (p: [ p.pyyaml ]))
    rsync
    sshpass
    whois
    xmlstarlet
    zstd
  ];

  services.nfs.server.enable = true;
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
  programs.nix-ld.enable = true;

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
}
