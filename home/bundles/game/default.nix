{ pkgs, ... }:
{
  home.packages = with pkgs; [
    heroic
    legendary-gl
    wineWowPackages.stable
  ];
}
