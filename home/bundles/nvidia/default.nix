{ pkgs, ... }:
{
  home.packages = [ pkgs.nvtopPackages.nvidia ];

  programs.i3status-rust.bars.default.blocks = [
    {
      block = "nvidia_gpu";
      format = " $icon $utilization $temperature ";
    }
  ];
}
