{ pkgs, ... }:
{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      copy_command = "xclip -selection clipboard";
      show_startup_tips = false;
    };
  };

  xdg.configFile."zellij/layouts/nix-config.kdl".text = ''
    layout {
        default_tab_template {
            pane size=1 borderless=true {
                plugin location="tab-bar"
            }
            children
            pane size=1 borderless=true {
                plugin location="status-bar"
            }
        }
        tab name="nix config" cwd="/home/jack/code/github.com/jack-kelly/nix-config" focus=true
    }
  '';

  xdg.configFile."zellij/layouts/nix-config.swap.kdl".text = builtins.readFile (
    pkgs.runCommand "zellij-default-swap-layout" { } ''
      ${pkgs.zellij}/bin/zellij setup --dump-swap-layout default > $out
    ''
  );
}
