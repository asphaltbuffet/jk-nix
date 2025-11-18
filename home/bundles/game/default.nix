{ pkgs, ... }:
{
  home.packages = with pkgs; [
    lutris
    heroic
    legendary-gl
    wineWowPackages.unstableFull
  ];
}
