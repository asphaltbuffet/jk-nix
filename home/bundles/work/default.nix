{ pkgs, ... }:
{
  home.packages = with pkgs; [
    awscli2
    minicom
    uv

    slack
  ];
}
