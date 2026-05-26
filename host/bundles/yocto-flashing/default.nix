{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.parted # partprobe, used by initrd-flash
  ];

  # initrd-flash uses udisksctl to mount/unmount the in-target USB
  # storage device exposed during programming. Needs the daemon (this
  # option) and the CLI (provided by the same package).
  services.udisks2.enable = true;

  # Prevent desktop file managers from auto-mounting the in-target USB
  # block device while initrd-flash is using it.
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="block", ENV{UDISKS_AUTO}="0"
  '';
}
