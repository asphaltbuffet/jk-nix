{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      terminal = {
        shell = "${pkgs.zsh}/bin/zsh";
      };

      env = {
        "TERM" = "xterm-256color";
      };

      window = {
        padding.x = 10;
        padding.y = 10;
        decorations = "buttonless";
      };

      keyboard.bindings = [
        {
          key = "Return";
          mods = "Shift";
          chars = builtins.fromJSON ''"\u001B\r"'';
        }
      ];
    };
  };
}
