{
  pkgs,
  ...
}:
{
  imports = [
    ../modules/broot.nix
    ../modules/git.nix
    ../modules/eza.nix
    ../modules/fzf.nix
    ../modules/direnv.nix
    ../modules/zsh.nix
    ../modules/starship.nix
    # ../modules/alacritty.nix
    ../modules/zoxide.nix
  ];
  nixpkgs = {
    overlays = [ ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  targets.genericLinux.enable = true;

  systemd.user.startServices = "sd-switch";
  systemd.user.targets.tray = {
    Unit = {
      Description = "Home Manager System Tray";
      Requires = [ "graphical-session-pre.target" ];
    };
  };

  fonts.fontconfig.enable = true;

  home = {
    username = "jack";
    homeDirectory = "/home/jack";
    stateVersion = "22.11";
    packages = with pkgs; [
      _1password-gui
      alacritty
      discord
      obsidian
      vscode
      slack
      chromium
      firefox
      spotify

      #(nerdfonts.override { fonts = [ "Inconsolata" "FiraCode" ]; })
      nerd-fonts.inconsolata
      nerd-fonts.fira-code

      awscli2

      _1password-cli
      direnv
      difftastic
      dig
      eza
      fd
      fzf
      gitui
      helix
      htop
      jq
      killall
      lazygit
      minicom
      nil
      nixfmt-rfc-style
      p7zip
      ripgrep
      tree
      trippy
      unzip
      uv
      xclip
      xh
      xz
      yazi
      zellij
    ];
  };

  xdg.enable = true;

  programs = {
    alacritty.enable = true;
    home-manager.enable = true;
    htop.enable = true;
    bat.enable = true;
    spotify-player.enable = true;
  };

  services.flameshot = {
    enable = true;
    settings.General = {
      showStartupLaunchMessage = false;
    };
  };
}
