{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      copy_command = "xclip -selection clipboard";
      ui.pane_frames.hide_session_name = true;
      show_startup_tips = false;
    };
  };
}
