{ pkgs, ... }:
{
  home.packages = with pkgs; [
    awscli2
    minicom
    uv

    slack
    saleae-logic
    gemini-cli
  ];
}
