mod: {
  "${mod}+d" = "exec rofi -show run";
  "${mod}+q" = "kill";

  "${mod}+Return" = "exec alacritty";

  "${mod}+h" = "split h";
  "${mod}+v" = "split v";
  "${mod}+f" = "fullscreen";
  "${mod}+s" = "layout stacking";
  "${mod}+t" = "layout tabbed";
  "${mod}+e" = "layout default";
  "${mod}+g" = "exec rofi -show window";


  "${mod}+1" = "workspace 1";
  "${mod}+2" = "workspace 2";
  "${mod}+3" = "workspace 3";

  "${mod}+Shift+H" = "focus left";
  "${mod}+Shift+J" = "focus down";
  "${mod}+Shift+K" = "focus up";
  "${mod}+Shift+L" = "focus right";

  "${mod}+Shift+Left" = "move left";
  "${mod}+Shift+Down" = "move down";
  "${mod}+Shift+Up" = "move up";
  "${mod}+Shift+Right" = "move right";
}
