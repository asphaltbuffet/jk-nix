{ pkgs, pkgs-stable, ... }:
{
  home.packages =
    (with pkgs; [
      awscli2
      openvpn
      networkmanager-openvpn
      uv

      claude-code
      saleae-logic
      gemini-cli
    ])
    ++ (with pkgs-stable; [
      slack
    ]);
}
