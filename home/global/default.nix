{
  lib,
  pkgs,
  ...
}:
{
  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
        "ca-derivations"
      ];
    };
  };
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
  };

  xdg.enable = true;
}
