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
        tab name="nix config" cwd="/home/jack/code/github.com/jack-kelly/nix-config" focus=true {
            pane size=1 borderless=true {
                plugin location="tab-bar"
            }
            pane
            pane size=1 borderless=true {
                plugin location="status-bar"
            }
        }
    }
  '';
}
