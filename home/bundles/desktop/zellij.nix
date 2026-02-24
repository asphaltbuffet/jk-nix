{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      copy_command = "xclip -selection clipboard";
    };
  };
}
