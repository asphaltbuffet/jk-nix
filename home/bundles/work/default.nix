{ pkgs, ... }:
{
  home.packages = with pkgs; [
    awscli2
    openvpn
    networkmanager-openvpn
    minicom
    uv

    slack
    saleae-logic
    gemini-cli
  ];
}
