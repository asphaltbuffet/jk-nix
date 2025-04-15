{
  pkgs,
  ...
}:
{
  imports = [
    ./global
    ../modules/home/broot.nix
    ../modules/home/git.nix
    ../modules/home/eza.nix
    ../modules/home/fzf.nix
    ../modules/home/direnv.nix
    ../modules/home/zsh.nix
    ../modules/home/starship.nix
    ../modules/home/zoxide.nix
  ];
  nixpkgs = {
    overlays = [ ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

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
      nh
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
