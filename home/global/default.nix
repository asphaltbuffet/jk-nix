{
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ../bundles/cli
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  targets.genericLinux.enable = true;

  systemd.user.startServices = "sd-switch";

  programs = {
    home-manager.enable = true;
    git.enable = true;
  };

  home = {
    username = lib.mkDefault "jack";
    homeDirectory = lib.mkDefault "/home/jack";
    stateVersion = lib.mkDefault "22.11";
    shell.enableZshIntegration = true;
  };

  xdg.enable = true;
}
