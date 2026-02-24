{ pkgs, ... }:
{
  home.packages = with pkgs; [
    awscli2
    openvpn
    networkmanager-openvpn
    uv

    claude-code
    slack
    saleae-logic
    gemini-cli
  ];
}
