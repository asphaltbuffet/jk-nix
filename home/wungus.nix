{ pkgs, ... }:
{
  imports = [
    ./global
    ./bundles/desktop
    ./bundles/work
  ];

  xdg.configFile = {
    "autostart/obsidian.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=Obsidian
      Exec=${pkgs.obsidian}/bin/obsidian
      X-GNOME-Autostart-enabled=true
    '';

    "autostart/discord.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=Discord
      Exec=${pkgs.discord}/bin/discord
      X-GNOME-Autostart-enabled=true
    '';

    "autostart/signal-desktop.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=Signal
      Exec=${pkgs.signal-desktop}/bin/signal-desktop
      X-GNOME-Autostart-enabled=true
    '';
  };
}
