mod: {
  "${mod}+d" = "exec rofi -show run";
  "${mod}+q" = "kill";

  "${mod}+Return" = "exec emacsclient -c";
  "${mod}+Tab" = "exec rofi -show";

  "${mod}+f" = "fullscreen";
  "${mod}+s" = "layout stacking";
  "${mod}+t" = "layout tabbed";
  "${mod}+e" = "layout default";
  "${mod}+g" = "exec $HOME/.config/polybar/launch.sh --docky";

  "${mod}+1" = "workspace 1";
  "${mod}+2" = "workspace 2";
  "${mod}+3" = "workspace 3";
  "${mod}+4" = "workspace 4";
  "${mod}+5" = "workspace 5";
  "${mod}+6" = "workspace 6";

  "${mod}+Shift+H" = "focus left";
  "${mod}+Shift+J" = "focus down";
  "${mod}+Shift+K" = "focus up";
  "${mod}+Shift+L" = "focus right";

  "${mod}+H" = "move left";
  "${mod}+J" = "move down";
  "${mod}+K" = "move up";
  "${mod}+L" = "move right";

  "${mod}+Left" = "move left";
  "${mod}+Down" = "move down";
  "${mod}+Up" = "move up";
  "${mod}+Right" = "move right";

  "${mod}+Shift+1" = "move container to workspace 1";
  "${mod}+Shift+2" = "move container to workspace 2";
  "${mod}+Shift+3" = "move container to workspace 3";
  "${mod}+Shift+4" = "move container to workspace 4";
  "${mod}+Shift+5" = "move container to workspace 5";
  "${mod}+Shift+6" = "move container to workspace 6";
  "${mod}+Shift+7" = "move container to workspace 7";
}
