{
  lib,
  modulesPath,
  pkgs,
  ...
}:
{
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
  ];

  # Override systemd-boot (set by global bundle) — ISO uses GRUB/syslinux
  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.loader.efi.canTouchEfiVariables = lib.mkForce false;

  # Disko declares fileSystems/LUKS/swap — override for ISO live boot
  disko.enableConfig = lib.mkForce false;
  fileSystems = lib.mkForce { };
  boot.initrd.luks.devices = lib.mkForce { };
  swapDevices = lib.mkForce [ ];

  # Recovery tools
  environment.systemPackages = with pkgs; [
    gparted
    cryptsetup
    ntfs3g
    (writeShellScriptBin "install-system" ''
      set -euo pipefail

      if [ -z "''${1:-}" ]; then
        echo "Usage: install-system <hostname>"
        exit 1
      fi
      HOSTNAME="$1"

      echo "==> Installing NixOS for host: $HOSTNAME"

      # Prompt for LUKS password if needed
      read -rsp "Enter LUKS passphrase (leave empty if no LUKS): " LUKS_PASS
      echo

      if [ -n "$LUKS_PASS" ]; then
        echo "$LUKS_PASS" > /tmp/luks-password
        chmod 600 /tmp/luks-password
      fi

      echo "==> Running disko to partition and format disks..."
      disko --mode format --flake "/etc/nixos#$HOSTNAME"

      echo "==> Mounting filesystems..."
      disko --mode mount --flake "/etc/nixos#$HOSTNAME"

      echo "==> Running nixos-install..."
      nixos-install --flake "/etc/nixos#$HOSTNAME" --no-root-password

      # Clean up
      rm -f /tmp/luks-password

      echo "==> Done! You can now reboot into your new system."
    '')
  ];

  # Live environment convenience
  security.sudo.wheelNeedsPassword = lib.mkForce false;
  users.users.jack.initialHashedPassword = lib.mkForce "";
}
