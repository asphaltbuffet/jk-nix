{ ... }:
{
  programs.i3status-rust = {
    enable = true;
    bars = {
      default = {
        theme = "ctp-mocha";
        icons = "material-nf";
        blocks = [
          {
            block = "focused_window";
            format = " $title.str(max_w:50) |";
          }
          {
            block = "disk_space";
            path = "/";
            format = " $icon $available ";
            warning = 20.0;
            alert = 10.0;
          }
          {
            block = "memory";
            format = " $icon $mem_used_percents.eng(w:1) ";
          }
          {
            block = "cpu";
            interval = 2;
            format = " $icon $utilization ";
          }
          {
            block = "temperature";
            format = " $icon $max ";
            chip = "*-isa-*";
          }
          {
            block = "nvidia_gpu";
            format = " $icon $utilization $temperature ";
          }
          {
            block = "sound";
            format = " $icon $volume ";
          }
          {
            block = "backlight";
            format = " $icon $brightness ";
          }
          {
            block = "battery";
            format = " $icon $percentage $time ";
          }
          {
            block = "time";
            interval = 30;
            format = " $icon $timestamp.datetime(f:'%a %m/%d %I:%M %p') ";
          }
        ];
      };
    };
  };
}
