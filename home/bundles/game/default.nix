{ pkgs, ... }:
{
  home.packages = with pkgs; [
    lutris
    heroic
    legendary-gl
    wineWow64Packages.unstableFull
  ];
}
