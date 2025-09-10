{ pkgs, ... }:
{
  home.packages = with pkgs; [
    awscli2
    networkmanager-openvpn
    minicom
    uv

    slack
    saleae-logic
    gemini-cli
  ];
}
