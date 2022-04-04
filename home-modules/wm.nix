{ config, lib, pkgs, ... }:

with lib;
let
  wallpaper = ../static/wallpaper.jpg;

in
{
  options = {
    dotfiles.wm.enabled = mkEnableOption "wm";
  };
  config = mkIf config.dotfiles.wm.enabled {
    xsession = {
      enable = true;
      windowManager = {
        command = "i3";
      };
    };

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
      ntworkmanagerapplet
      parcellite
      pasystray
      pavucontrol
      libnotify
      lxappearance
      playerctl
      loadEditorLayout
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
        pasystray &
        xautolock \
          -detectsleep \
          -time 30 -locker "betterlockscreen --lock" \
          -notify 10 -notifier 'notify-send -t 10000 "Screen lock oncoming."' &
      '';
    };
  }
