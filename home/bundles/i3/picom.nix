{ ... }:
{
  services.picom = {
    enable = true;
    backend = "glx";
    vSync = true;

    shadow = true;
    shadowOffsets = [ (-7) (-7) ];
    shadowOpacity = 0.6;
    shadowExclude = [
      "name = 'Notification'"
      "class_g = 'i3-frame'"
    ];

    fade = true;
    fadeSteps = [ 0.03 0.03 ];

    settings = {
      corner-radius = 8;
      rounded-corners-exclude = [
        "class_g = 'i3-frame'"
        "class_g = 'i3bar'"
      ];
      blur-background = false;
    };
  };
}
