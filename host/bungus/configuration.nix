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
}
