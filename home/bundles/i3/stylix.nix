{ pkgs, ... }:
{
  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "dark";

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    image = ../../../assets/wallpaper.png;

    cursor = {
      package = pkgs.catppuccin-cursors.mochaDark;
      name = "catppuccin-mocha-dark-cursors";
      size = 24;
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font";
      };
      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };
      sizes = {
        terminal = 10;
        applications = 11;
        popups = 11;
      };
    };

    opacity = {
      terminal = 0.95;
    };

    targets = {
      alacritty.enable = true;
      rofi.enable = true;
      gtk.enable = true;
      i3.enable = true;
      feh.enable = true;
    };
  };

  xdg.configFile."wallpaper".source = ../../../assets/wallpaper.png;
}
