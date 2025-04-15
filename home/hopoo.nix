{
  pkgs,
  ...
}:
{
  imports = [
    ./global
    ../modules/git.nix
    ../modules/eza.nix
    ../modules/fzf.nix
    ../modules/direnv.nix
    ../modules/zsh.nix
    ../modules/starship.nix
    ../modules/zoxide.nix
  ];
  nixpkgs = {
    overlays = [ ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  fonts.fontconfig.enable = true;

  home = {
    packages = with pkgs; [
      alacritty
      _1password-gui
      discord
      obsidian
      firefox
      spotify

      #(nerdfonts.override { fonts = [ "Inconsolata" "FiraCode" ]; })
      nerd-fonts.fira-code
      nerd-fonts.inconsolata

      _1password-cli
      direnv
      difftastic
      eza
      fd
      fzf
      gitui
      helix
      htop
      jq
      killall
      lazygit
      p7zip
      ripgrep
      spotify-player
      tree
      unzip
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
    firefox.enable = true;
  };
}
