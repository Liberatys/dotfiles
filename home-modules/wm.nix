{ config, lib, pkgs, ... }:

with lib;
let
  wallpaper = ../assets/wallpaper.jpg;
in
{
  options = {
    dotfiles.wm.enabled = mkEnableOption "wm";
  };

  config = mkIf config.dotfiles.wm.enabled {
    home.packages = with pkgs; [
      i3
      betterlockscreen
      i3blocks
      dunst
      feh
      rofi
      unclutter
      xautolock
      xfontsel
      xorg.xbacklight
      xorg.xev
      xorg.xkill
      keynav
      parcellite
      pasystray
      libnotify
      lxappearance
      playerctl
    ];

    home.file.".config/i3/autostart.sh" = {
      executable = true;
      text = ''
        feh --bg-fill "${wallpaper}" --no-xinerama &

        sleep 1
        ergo &
        keynav &
        unclutter &
        nm-applet &
        parcellite &
        pasystray
      '';
    };
  };
}
